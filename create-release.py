# The BeagleV Fire Bitstream Builder is released under the following software license:

#  Copyright 2021 Microchip Corporation.
#  SPDX-License-Identifier: MIT


#  Permission is hereby granted, free of charge, to any person obtaining a copy
#  of this software and associated documentation files (the "Software"), to
#  deal in the Software without restriction, including without limitation the
#  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
#  sell copies of the Software, and to permit persons to whom the Software is
#  furnished to do so, subject to the following conditions:

#  The above copyright notice and this permission notice shall be included in
#  all copies or substantial portions of the Software.

#  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
#  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
#  IN THE SOFTWARE.


# The BeagleV Fire Bitstream Builder is an evolution of the Microchip
# Bitstream Builder available from:
# https://github.com/polarfire-soc/icicle-kit-minimal-bring-up-design-bitstream-builder
#


import argparse

from gateware_scripts.create_release import create_release


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


def main():
    build_options_dir_name = parse_arguments()
    create_release(build_options_dir_name)


if __name__ == '__main__':
    main()
