# BeagleV Fire Gateware Builder

## Introduction
The BeagleV Fire gateware builder is a Python script that builds both the PolarFire SoC HSS bootloader and Libero FPGA project into a single programming bitstream. It uses a list of repositories/branches specifying the configuration of the BeagleV Fire to build.


## Prerequisites
### Python libraries
The following Python libraries are used:
- GitPython
- PyYAML

```
pip3 install gitpython
pip3 install pyyaml
```

### Microchip Tools
The SoftConsole and Libero tools from Microchip are required by the bitstream builder.

The following environment variables are required for the bitstream builder to use the Microchip tools:
- SC_INSTALL_DIR
- FPGENPROG
- LIBERO_INSTALL_DIR
- LM_LICENSE_FILE

An example script for setting up the environment is available [here](https://openbeagle.org/beaglev-fire/Microchip-FPGA-Tools-Setup). 

## Usage

```
python3 build-bitstream.py <YAML Configuration File>
```

For example, the following command will be build the default beagleV Fire configuration:
```
python3 build-bitstream.py ./build-options/default.yaml
```


### YAML Configuration Files
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