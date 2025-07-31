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
import os
import sys

import gateware_scripts
from gateware_scripts.build_gateware import build_gateware

global yaml_input_file


# Parse command line arguments and set tool locations
def parse_arguments():
    global yaml_input_file

    # Initialize parser
    parser = argparse.ArgumentParser()

    parser.add_argument('Path',
                       metavar='path',
                       type=str,
                       help='Path to the YAML file describing the list of sources used to build the bitstream.')

    # Read arguments from command line
    args = parser.parse_args()
    yaml_input_file_arg = args.Path

    if not os.path.isfile(yaml_input_file_arg):
        print("\r\n!!! The path specified for the YAML input file does not exist !!!\r\n")
        parser.print_help()
        sys.exit()

    yaml_input_file = os.path.abspath(yaml_input_file_arg)


def main():
    global yaml_input_file

    parse_arguments()

    build_gateware(yaml_input_file, ".", ".")


if __name__ == '__main__':
    main()
