# Microprocessor Subsystem GPIO Controllers Pin Assignment
The Microprocess Subsystem's (MSS) includes 3 GPIO controllers.


|  Name  | Base Address | Linux Name |
|--------|--------------|------------|
| GPIO_0 |  0x20120000  |    gpio0   |
| GPIO_1 |  0x20121000  |    gpio1   |
| GPIO_2 |  0x20122000  |    gpio2   |


## GPIO_0 pin assignment
1.8V I/Os connected to I/O bank4. These GPIOs share pins with other MSS functions. As a result only a limited number of GPIOs from this controller are usable.

| GPIO # | Type  | Function       |
|--------|-------|----------------|
|  0-11  |  n/a  | Unused         |
|   12   |  out  | SD_CARD_CS     |
|   13   |   in  | User button    |


## GPIO_1 pin assignment
3.3V I/Os connected to I/O bank2. These GPIOs share pins with other MSS functions. As a result only a limited number of GPIOs from this controller are usable.

| GPIO # | Type  | Function       |
|--------|-------|----------------|
|  0-19  |  n/a  | Unused         |
|   20   |   in  | ADC_IRQn       |
|  21-22 |  n/a  | Unused         |
|   23   |   in  | USB_OCn        |

## GPIO_2 pin assignment
The MSS GPIO_2 block's inputs and output are routed through the FPGA fabric to the PolarFire SoC's pins. The function of these GPIOs can be customized by the content of the FPGA. However, there is GPIOs expected to remain constant across designs.

| GPIO # | Type  | Function       |
|--------|-------|----------------|
|  0-26  | inout | Routed to FPGA |
| 27-29  |  n/a  | Non-assigned   |
|   30   |  out  | VIO_ENABLE     |
|   31   |   in  | SD_DET         |

