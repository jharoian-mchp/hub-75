# SPDX-License-Identifier: MIT
import argparse
import os
import subprocess
import shutil
from junit_xml import TestSuite, TestCase
import yaml
from distutils.dir_util import copy_tree

from gateware_scripts.build_gateware import build_gateware


def get_build_option_file_list(build_options_dir_name):
    build_options_path = os.path.join(os. getcwd(), build_options_dir_name)
    build_option_files = []
    for file in os.listdir(build_options_path):
        if file.endswith('.yaml'):
            build_option_files.append(os.path.join(build_options_dir_name, file))
    return build_option_files


def build_bitstreams(build_option_files):
    tester_top_dir = os.getcwd()
    build_dir = "builds"
    if not os.path.exists(build_dir):
        os.makedirs(build_dir)

    for build_option in build_option_files:
        option_build_dir_name = os.path.splitext(os.path.basename(build_option))[0]
        print("Build bistream configuration: ", option_build_dir_name)
        cwd = os.getcwd()
        dst_dir = os.path.join(build_dir, option_build_dir_name)
        
        if not os.path.exists(dst_dir):
            os.makedirs(dst_dir)
        os.chdir(dst_dir)

        build_option_path = os.path.join(tester_top_dir, build_option)

        build_gateware(build_option_path, dst_dir, tester_top_dir)
        os.chdir('../..')

def make_chdir(dir_name):
    if not os.path.exists(dir_name):
        os.makedirs(dir_name)
    os.chdir(dir_name)
    return os.getcwd()


def gather_artifacts(build_option_files):
    root_build_dir = os.path.join(os.getcwd(), "builds")
    root_artifacts_dir = make_chdir("artifacts")

    root_build_logs_dir = make_chdir("build_logs")
    os.chdir('..')

    root_bitstreams_dir = make_chdir("bitstreams")
    os.chdir('..')

    for build_option in build_option_files:
        option_build_dir_name = os.path.splitext(os.path.basename(build_option))[0]
        os.chdir(root_build_logs_dir)
        cwd = make_chdir(option_build_dir_name)

        # Build log:
        src = os.path.join(root_build_dir, option_build_dir_name, "build_log.txt")
        dst = os.path.join(cwd, "build_log.txt")
        shutil.copy(src, dst)

        # Synthesis logs:
        src = os.path.join(root_build_dir, option_build_dir_name, "work", "libero", "synthesis")
        dst = os.path.join(cwd, "synthesis")
        if os.path.exists(src):
            shutil.copytree(src, dst)

        # Bitstreams:
        os.chdir(root_bitstreams_dir)
        cwd = make_chdir(option_build_dir_name)
        src = os.path.join(root_build_dir, option_build_dir_name, "bitstream")
        shutil.copytree(src, cwd, dirs_exist_ok=True)

        os.chdir('..')

    os.chdir('../..')


def get_hss_build_testcase(build_name, log):
    testcase = TestCase('HSS build', build_name, 123.345, '', '')
    if log.find('INFO: Successfully generated MSS component') == -1:
        testcase.add_error_info('MSS component not created.')
    if log.find('INFO  - mpfsBootmodeProgrammer completed successfully.') == -1:
        testcase.add_error_info('HSS executable not created.')
    return testcase


def get_synthesis_test_case(build_name, log):
    testcase = TestCase('Synthesis', build_name, 123.345, '', '')
    if log.find('Synthesis completed.') == -1:
        testcase.add_error_info('Synthesis failed.')
    return testcase


def get_place_route_test_case(build_name, log):
    testcase = TestCase('Place and route', build_name, 123.345, '', '')
    if log.find('Router completed successfully.') == -1:
        testcase.add_error_info('Place and route failed.')
    return testcase


def get_timing_analysis_test_case(build_name, log):
    testcase = TestCase('Timing analysis', build_name, 123.345, '', '')
    testcase.add_skipped_info('Timing analysis not enabled')
    return testcase


def get_bitstream_test_case(build_name, log):
    testcase = TestCase('Bitstream generation', build_name, 123.345, '', '')
    if log.find('Successfully generated bitstream file') == -1:
        testcase.add_error_info('Bitstream generation failed.')
    return testcase


def create_report(build_option_files):
    os.chdir("artifacts")
    os.chdir("build_logs")
    tss = []
    for build_option in build_option_files:
        build_name = os.path.splitext(os.path.basename(build_option))[0]
        with open(os.path.join(build_name, "build_log.txt"), 'rt') as f:
            log = f.read()
            test_cases = [get_hss_build_testcase(build_name, log), get_synthesis_test_case(build_name, log),
                          get_place_route_test_case(build_name, log), get_timing_analysis_test_case(build_name, log),
                          get_bitstream_test_case(build_name, log)]

            ts = TestSuite(build_name, test_cases)
            tss.append(ts)

    os.chdir('..')
    with open("tests_report.xml", "w") as f:
        TestSuite.to_file(f, tss, prettyprint=True)
    f.close()
    os.chdir('..')


def zip_artifacts():
    dir_name = os.path.join(os.getcwd(), "artifacts")
    shutil.make_archive("artifacts", 'zip', dir_name)


def parse_arguments():
    # Initialize parser
    parser = argparse.ArgumentParser()

    parser.add_argument('BuildOptionsDir',
                        type=str,
                        help="Directory containing the gateware build options to build.",
                        action="store",
                        default="build-options",
                        nargs='?')

    # Read argument(s) from command line
    args = parser.parse_args()
    return args.BuildOptionsDir


def adjust_debian_custom(build_options_dir_name, build_option_files):
    print(build_options_dir_name)
    print(build_option_files)
    cwd = os.getcwd()
    print(cwd)
    artifacts_dir = os.path.join(os.getcwd(), "artifacts")
    if not os.path.exists(artifacts_dir):
        os.makedirs(artifacts_dir)
    debian_custom_dir = os.path.join(artifacts_dir, "debian-custom")
    if not os.path.exists(debian_custom_dir):
        os.makedirs(debian_custom_dir)

    debian_dir = os.path.join(artifacts_dir, "debian")
    copy_tree("debian", debian_dir)
    copy_tree("debian-custom", debian_custom_dir)

    gateware_names = []
    for build_option in build_option_files:
        if build_option.endswith(".yaml"):
            gateware_names.append(build_option.strip(".yaml").split(os.sep)[-1])

    debian_custom_path = os.path.join(debian_custom_dir, "bbb.io-gateware-my-custom-fpga-design.install")
    template_path = os.path.join(cwd, "gateware_scripts", "debian-custom-templates", "bbb.io-gateware-my-custom-fpga-design.install")
    with open(template_path, 'rt') as f_template:
        template = f_template.read()
        full_gateware_file_list = ""
        for gateware in gateware_names:
            gateware_file_list = template.replace("<CUSTOM-GATEWARE-NAME>", gateware)
            print(gateware_file_list)
            full_gateware_file_list += gateware_file_list

        with open(debian_custom_path, 'wt') as f_debian_custom_gateware:
            f_debian_custom_gateware.write(full_gateware_file_list)


def create_release(build_options_dir_name):
    print("Test gateware builds.")
    build_option_files = get_build_option_file_list(build_options_dir_name)
    adjust_debian_custom(build_options_dir_name, build_option_files)
    print("Build bitstreams.")
    build_bitstreams(build_option_files)
    print("Gather up artifacts.")
    gather_artifacts(build_option_files)
    print("Create build test report.")
    create_report(build_option_files)
    zip_artifacts()
    print("Gateware tests Complete")


if __name__ == '__main__':
    build_options_dir_name = parse_arguments()
    create_release(build_options_dir_name)
