# User LEDs
The user LEDs are controlled from an FPGA fabric GPIO controller included within the RISC-V Processor Subsystem. GPIOs are connected to their respective pins through a User LED Pads FPGA logic block. Keeping the USer LED Pads block at the top of the gateware design allows esily overiding LEDs control by logic from another part of the FPGA design.

The GPIO controller for the user LEDs is located at address 0x40000000.

| LED # | GPIO # | Cape pin # |
|-------|--------|------------|
|   0   |    0   |  P8 pin 3  |
|   1   |    1   |  P8 pin 4  |
|   2   |    2   |  P8 pin 5  |
|   3   |    3   |  P8 pin 6  |
|   4   |    4   |  P8 pin 7  |
|   5   |    5   |  P8 pin 8  |
|   6   |    6   |  P8 pin 9  |
|   7   |    7   |  P8 pin 10 |
|   8   |    8   |  P8 pin 11 |
|   9   |    9   |  P8 pin 12 |
|  10   |   10   |  P8 pin 13 |
|  11   |   11   |  P8 pin 14 |

