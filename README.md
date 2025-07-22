# BeagleV Fire Gateware Builder

## Introduction
The BeagleV Fire gateware builder is a Python script that builds both the PolarFire SoC HSS bootloader and Libero FPGA project into a single programming bitstream. It uses a list of repositories/branches specifying the configuration of the BeagleV Fire to build.


## Prerequisites
### Python libraries
The following Python libraries are used:
- GitPython
- PyYAML
- Requests

```
pip3 install GitPython PyYAML requests
```

Using a virtual envirnoment is recommended.  Be sure to activate prior to running build script.

### Microchip Tools

The SoftConsole and Libero tools from Microchip are required by the bitstream builder.

The following environment variables are required for the bitstream builder to use the Microchip tools:
- SC_INSTALL_DIR
- FPGENPROG
- LIBERO_INSTALL_DIR
- LM_LICENSE_FILE

An example script for setting up the environment on Ubuntu is located in the tool_scripts folder.  Edit to match environment and source each time a terminal session opens.

```
source tool_scripts/setup-microchip-tools.sh
```

## Usage

```
python3 build-bitstream.py <YAML Configuration File>
```

For example, the following command will be build the default beagleV Fire configuration:
```
python3 build-bitstream.py ./customer-fpga-design/my_custom_fpga_design.yaml
```


### YAML Configuration Files
The YAML configuration file for Hub-75 Cube is located in the custom-fpga-design folder.

| Configuration File         | Description          |
| -------------------------- | -------------------- |
| my_custom_fpga_design.yaml | Hub-75 Cube gateware |

The YAML configuration files are located in the "build-options" directory.

| Configuration File | Description                                                |
| ------------------ | ---------------------------------------------------------- |
| default.yaml       | Default gateware including default cape and M.2 interface. |
| minimal.yaml       | Minimal Linux system including Ethernet. No FPGA gateware. |
| robotics.yaml      | Similar to default but supporting the Robotics cape.       |

## Supported Platforms

The BeagleV Fire gateware builder has been tested on Ubuntu 20.04.

## Microchip bitstream-builder
The BeagleV-Fire gateware builder is derived from [Microchip's bitstream-builder ](https://github.com/polarfire-soc/icicle-kit-minimal-bring-up-design-bitstream-builder). We recommend that you use either of these scripts as a starting point for your own PolarFire SoC FPGA designs as opposed to using Libero in isolation.

# Build instructions
This is more a description of how I have been working.....
With this repo cloned into a local directory I would typically be editing files in the sources/FPGA-design/script_support/components/CAPE/Hub75 folder.
This includes smart design components as well as pure HDL.

To initiate a build use the command:
`python3 build-bitstream.py ./custom-fpga-design/my_custom_fpga_design.yaml`

This will hopefully generate a complete bitstream ready for downloading to the target.
To copy the code to the target use something along the lines of:
`scp -r ./bitstream beagle@<IP address>:/home/beagle`
This will copy the compiled bitstream and device tree overlay to the target board.
# If the build didn't work
Rather than digging through the log, if the build did not succeed then from the command line try going into libero.
`libero &`
This will open up libero. You can find a full libero version of the project in the `/work` directory.
Open this up and try building and debugging form there.
# SmartDesign components
This projects uses a number of smart design components. It would have been nice to use inference and the appropriate HDL to automatically infer the correct components but I could not get this to work... For instance the framebuffer uses LSRAMs organised as 1x16384 for each bit of each colour (32 in all for RGB565 across two sections of the display). However synplify seemed unable to spot the correct macros so I had to resort to using SmartDesign components and explicitly using the DPLSRAM.
In order to use these in the design you need to right-click on the component in libero and export the tcl. Save this tcl in the folder:
`sources/FPGA-design/script_support/components/CAPE/Hub75`

Then edit the file ADD_CAPE.tcl and add these files somewhere in the middle...(look at the version in the repo. it worked!)
<code>
source script_support/components/CAPE/Hub75/PF_DPSRAM_C0.tcl
source script_support/components/CAPE/Hub75/MEM_BIT_PLANE2.tcl
source script_support/components/CAPE/Hub75/PF_CCC_C0.tcl
source script_support/components/CAPE/Hub75/LED_CCC.tcl
</code>

# Burning the image on the target
Having successfully copied the image on to the target you need to program it.
On the BeagleV-Fire issue the command
`sudo /usr/share/beagleboard/gateware/change-gateware.sh ./bitstream`
This will reprogram the BeagleV-Fire with the new bitstream.

# Support code
The software subdirectory contains a number of support applications to allow the Cape device to be manipulated via /dev/mem
Most of these commands require you to run them as `sudo`.
They will also need building. To make things simple at the moment I have been building them on the target (which conveniently has gcc already installed).
One important utility is `fb_dumpreg`. Using this you can see the configuraiton of the APB control registers including the test mode and pixels-per-row values.
You can control these to effect the Hub75 module...
For instance `sudo ./fb_dumpreg -w CONTROL=3` will turn on the test mode (bit 1 is generate pixel timing, bit 2 is generate test pattern of blocks).
the PPR register affects the number of pixels-per-row. Set this to the number of screens, for 5 screens use `sudo ./fb_dumpreg -w PPR=320`

In the latest version, a custom linux distribution is used which maps the Hub75 peripheral as a simple-framebuffer device. It shows up as /dev/fb0 and can be controlled from user space...

