# BeagleV Fire Gateware

## Description

This repository is used to generate the BeagleV Fire FPGA design. The scripts in this repository concentrate on generating the FPGA digital logic content and generating bitstreams. The complete gateware for the BeagleV Fire also includes a first stage bootloader (HSS) which configures the entire PolarFire SoC device. It is therefore recommended to use the **BeagleV Fire Bitstream Builder** to generate the complete gateware including the HSS for the BeagleV Fire. The BeagleV Fire Bitstream Builder is available [here](https://openbeagle.org/beaglev-fire/bitstream-builder)

**The scripts contained in this repository are only recommended to be used in isolation when modifying the FPGA digital logic.** Otherwise please use the [BeagleV Fire Bitstream Builder](https://openbeagle.org/beaglev-fire/bitstream-builder).

A set of Libero SoC Tcl scripts are provided to generate the FPGA design using Libero SoC along with device specific I/O constraints.

This repository supports Libero SoC v2022.3, which is available for download [here](https://www.microchip.com/en-us/products/fpgas-and-plds/fpga-and-soc-design-tools/fpga/libero-software-later-versions#downloads).

## Using the reference design generation Tcl script
The gateware is built by executing a Libero Tcl script. The default gateware configuration is built using the command below:
```
libero SCRIPT:BUILD_BVF_GATEWARE.tcl
```

Arguments can be passed to the Tcl script to select build options for the design or prevent Libero from running through the entire flow.
```
libero SCRIPT:BUILD_BVF_GATEWARE.tcl "SCRIPT_ARGS: ONLY_CREATE_DESIGN M2_OPTION:NONE CAPE_OPTION:NONE"
```

### Available arguments:

#### ONLY_CREATE_DESIGN
Stops the FPGA flow before running synthesis. This is useful to inspect the generated FPGA design before running through the Synthesis/Place and route/Bitstream FPGA flow.

#### CAPE_OPTION
Specifies the build option for the digital logic attached to the cape connectors. Valid values are the directory names in ./script_support/components/CAPE. If you wish to create an alternate build option, add a new directory in ./script_support/components/CAPE using one of the existing ones as template. This is a good place to start if you want to play with FPGA digital logic.

#### M2_OPTION
Specifies the build option for the digital logic attached to the M.2 connector. Options are DEFAULT to enable the wi-fi interface or NONE if you do not need wi-fi and want to use the third transceiver on the SYZYGY connector..

#### SYZYGY_OPTION
Specifies the build option for the digital logic attached to the SYZYGY high speed connector. Valid values are the directory names in ./script_support/components/SYZYGY. If you wish to create an alternate build option, add a new directory in ./script_support/components/SYZYGY using one of the existing ones as template. This is a good place to experiment if you want to use wired communications up to 12.5Gbps.

#### MIPI_CSI_OPTION
Specifies the build option associated with the camera interface. Valid values are the directory names in ./script_support/components/MIPI_CSI. If you wish to create an alternate build option, add a new directory using one of the existing ones as template.

#### PROJECT_LOCATION
Specifies where the generated Libero project will be located.

#### TOP_LEVEL_NAME
Specifies the name of the gateware's top level module. This will also be the name of the FPGA design reported through System Services and displayed at boot time by the Hart Software Services (HSS). This will allow you to identify what is actually programmed on the board.

#### PROG_EXPORT_PATH
Specifies the location where the programming files will be exported.

#### DESIGN_VERSION
Used to specify the FPGA design version which will be included in the programming bitstream. Please note that care must be taken in selecting a version number if you wish to use program the generated gateware from Linux. Version numbers must be different for gateware programming from Linux to be successful.
