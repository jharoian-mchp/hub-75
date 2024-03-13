import os
import struct
import ctypes
import sys
import subprocess

from gateware_scripts.gather_dtso import gather_dtso

global dtbo_info


def gen_magic():
    global dtbo_info
    struct.pack_into('cccc', dtbo_info, 0, b'M', b'C', b'H', b'P')


def gen_descriptor_length(no_of_contexts, no_of_dtbo):
    global dtbo_info
    descriptor_length = 12 + (4 * no_of_contexts) + (4 * no_of_dtbo)
    struct.pack_into('I', dtbo_info, 4, descriptor_length)


# 2 bytes longs version number
def gen_version():
    global dtbo_info
    version = 0
    struct.pack_into('H', dtbo_info, 8, version)


def gen_number_of_contexts(no_of_contexts):
    global dtbo_info
    in_number_of_contexts = no_of_contexts
    struct.pack_into('H', dtbo_info, 10, in_number_of_contexts)


def get_dtbo_files_list():
    initial_directory = os.getcwd()
    context_dir = os.path.join(initial_directory, "work", "dtbo", "context-0")
    dtbo_files_list = []
    for root, dirs, files in os.walk(context_dir):
        for file in files:
            if file.endswith(".dtbo"):
                dtbo_files_list.append(os.path.join(root, file))
    return dtbo_files_list


def get_dtbo_total_size(dtbo_list):
    size = 0
    for dtbo_file in dtbo_list:
        size = size + os.path.getsize(dtbo_file)
    return size


def gen_dtbo_info(overlay_dir_path, no_of_contexts, dtbo_list):
    dtbo_desc_list_start_offset = 12 + (no_of_contexts * 4)
    struct.pack_into('I', dtbo_info, 12, dtbo_desc_list_start_offset)
    no_of_dtbo = len(dtbo_list)
    struct.pack_into('I', dtbo_info, 16, no_of_dtbo)
    dtbo_data_offset = 20 + (no_of_dtbo * 12)
    dtbo_idx = 0
    for dtbo_file in dtbo_list:
        size = os.path.getsize(dtbo_file)
        struct.pack_into('I', dtbo_info, 20 + (dtbo_idx * 12), dtbo_data_offset)
        struct.pack_into('I', dtbo_info, 24 + (dtbo_idx * 12), dtbo_data_offset + size)
        struct.pack_into('I', dtbo_info, 28 + (dtbo_idx * 12), size)
        dtbo_data_offset += size
        dtbo_idx += 1

    dtbo_full_path = os.path.join(overlay_dir_path, "mpfs_dtbo.spi")
    with open(dtbo_full_path, "wb") as mpfs_dtbo:
        mpfs_dtbo.write(dtbo_info)

    #
    # Append the actual dtbo files to the dtbo_file
    #
    with open(dtbo_full_path, "ab") as mpfs_dtbo:
        for dtbo_file in dtbo_list:
            with open(dtbo_file, "rb") as in_dtbo_file:
                mpfs_dtbo.write(in_dtbo_file.read())


def create_dtbo_info(overlay_dir_path):
    global dtbo_info

    dtbo_list = get_dtbo_files_list()
    print("number of gateware device tree overlays: ", len(dtbo_list))
    for dtbo_file in dtbo_list:
        print(dtbo_file)
    no_of_contexts = 1
    no_of_dtbo = len(dtbo_list)

    #
    # Generate the DTBO info binary.
    #
    dtbo_info_length = 12 + (8 * no_of_contexts) + (12 * no_of_dtbo)

    dtbo_info = ctypes.create_string_buffer(dtbo_info_length)
    gen_magic()
    gen_descriptor_length(no_of_contexts, no_of_dtbo)
    gen_version()
    gen_number_of_contexts(no_of_contexts)
    gen_dtbo_info(overlay_dir_path, no_of_contexts, dtbo_list)
    print(dtbo_info[:])


def get_gateware_git_version(work_dir):
    try:
        git_hash = subprocess.check_output(['git', 'describe', '--tags'])
    except subprocess.CalledProcessError as e:
        git_hash = b"\n"
    return git_hash.decode('ascii').strip("'").strip("\n")


def inject_git_info_into_src_dtso(dtso_file, git_version):
    with open(dtso_file, "r") as f:
        dtso = f.read()
        dtso = dtso.replace('GATEWARE_GIT_VERSION', git_version)
        with open(dtso_file, "w") as fout:
            fout.write(dtso)


def compile_dtso(work_dir):
    root_dir = os.path.join(work_dir, 'dtbo', 'context-0')
    git_version = get_gateware_git_version(work_dir)
    for root, dirs, files in os.walk(root_dir):
        for file in files:
            if file.endswith(".dtso"):
                dtso_file = os.path.join(root, file)
                inject_git_info_into_src_dtso(dtso_file, git_version)
                dtbo_file = os.path.splitext(dtso_file)[0] + '.dtbo'
                cmd = 'dtc -O dtb -I dts -o ' + dtbo_file + ' ' + dtso_file
                os.system(cmd)


def generate_device_tree_overlays(overlay_dir_path, build_options_list):
    print("================================================================================")
    print("                            Generate Device Tree Overlays")
    print("================================================================================\r\n", flush=True)
    bitstream_builder_root = os.getcwd()
    gateware_dir = os.path.join(bitstream_builder_root, 'sources', 'FPGA-design')
    work_dir = os.path.join(bitstream_builder_root, 'work')
    gather_dtso(gateware_dir, work_dir, build_options_list)
    compile_dtso(work_dir)
    create_dtbo_info(overlay_dir_path)


def generate_gateware_overlays(overlay_dir_path, build_options_list):
    generate_device_tree_overlays(overlay_dir_path, build_options_list)


if __name__ == '__main__':
    if len(sys.argv) > 1:
        argument_list = sys.argv[1:]
    else:
        argument_list = 'NONE'
    generate_device_tree_overlays(argument_list)
