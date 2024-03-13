# Gather device tree overlay dtso files from the gateware's
# script_support/components/<component-name>/<build-option-name>/device-tree-overlay
# directories into the bitstream builder's work/dtbo/context-0/<component-name>
# directories.
import os
import shutil
import sys


def gather_dtso(gateware_dir, work_dir, build_options):
    context_dir = os.path.join(gateware_dir, "script_support", "components")

    build_options_dict = {}
    if build_options != 'NONE':
        options = build_options.split()
        for option in options:
            opt = option.split(':')
            le = len("_OPTION")
            component_dir = opt[0][:-le]
            option_dir = opt[1]
            build_options_dict[component_dir] = option_dir

    dtbo_dir = os.path.join(work_dir, "dtbo")
    if not os.path.exists(dtbo_dir):
        os.makedirs(dtbo_dir)
    context_0_dir = os.path.join(dtbo_dir, "context-0")
    if not os.path.exists(context_0_dir):
        os.makedirs(context_0_dir)

    for root, dirs, files in os.walk(context_dir):
        for file in files:
            if file.endswith(".dtso"):
                dir_filename = os.path.split(root)
                if dir_filename[1] == 'device-tree-overlay':
                    option_name = os.path.split(dir_filename[0])[1]
                    component_name = os.path.split(os.path.split(dir_filename[0])[0])[1]
                    if component_name in build_options_dict:
                        desired_option = build_options_dict[component_name]
                    else:
                        desired_option = 'DEFAULT'
                    if option_name == desired_option:
                        print("  Device tree overlay selected:")
                        print("    component:                ", component_name)
                        print("    build option:             ", option_name)
                        print("    device tree overlay file: ", file)
                        component_dir = os.path.join(context_0_dir, component_name)
                        if not os.path.exists(component_dir):
                            os.makedirs(component_dir)
                        src_path = os.path.join(root, file)
                        dst_path = os.path.join(component_dir, file)
                        shutil.copy(src_path, dst_path)


if __name__ == '__main__':
    if len(sys.argv) < 3:
        print("Two arguments expected: gateware and work directory paths.")
        exit()

    argumentList = sys.argv[1:]
    gateware_dir = argumentList[0]
    work_dir = argumentList[1]

    if os.path.exists(gateware_dir):
        if os.path.exists(work_dir):
            gather_dtso(gateware_dir, work_dir, argumentList[2:])
        else:
            print("Invalid bitstream builder work directory.")
    else:
        print("Gateware directory does not exist.")
