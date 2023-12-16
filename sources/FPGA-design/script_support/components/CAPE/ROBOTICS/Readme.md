#  Robotics Cape

This cape gateware includes 4 quadrature decoders. The value for these decoders can be read from the physical addresses in the table below:


| Encoder pins (a/b) | Address of encoder value register |
|---|---|
| P9_42/P9_27 | 0x41300000 |
| P8_35/P8_33 | 0x41300010 |
| P8_12/P8_11 | 0x41300020 |
| P8_16/P8_15 | 0x41300030 |


## P8 Header

| Signal | Control                    | Irq # | Description        |
|--------|----------------------------|-------|--------------------|
| P8_1   | n/a                        |  n/a  | GND                |
| P8_2   | n/a                        |  n/a  | GND                |
| P8_3   | MSS GPIO_2[0]              |   53  | User LED 0         |
| P8_4   | MSS GPIO_2[1]              |   53  | User LED 1         |
| P8_5   | MSS GPIO_2[2]              |   53  | User LED 2         |
| P8_6   | MSS GPIO_2[3]              |   53  | User LED 3         |
| P8_7   | MSS GPIO_2[4]              |   53  | User LED 4         |
| P8_8   | MSS GPIO_2[5]              |   53  | User LED 5         |
| P8_9   | MSS GPIO_2[6]              |   53  | User LED 6         |
| P8_10  | MSS GPIO_2[7]              |   53  | User LED 7         |
| P8_11  | MSS GPIO_2[8]              |   53  | User LED 8         |
| P8_12  | MSS GPIO_2[9]              |   53  | User LED 9         |
| P8_13  | core_pwm[1] @ 0x41500000   |  n/a  | PWM_2:1            |
| P8_14  | MSS GPIO_2[11]             |   53  | User LED 11        |
| P8_15  | MSS GPIO_2[12]             |   53  | GPIO               |
| P8_16  | MSS GPIO_2[13]             |   53  | GPIO               |
| P8_17  | MSS GPIO_2[14]             |   53  | GPIO               |
| P8_18  | MSS GPIO_2[15]             |   53  | GPIO               |
| P8_19  | core_pwm[0] @ 0x41500000   |  n/a  | PWM_2:0            |
| P8_20  | MSS GPIO_2[17]             |   53  | GPIO               |
| P8_21  | MSS GPIO_2[18]             |   53  | GPIO               |
| P8_22  | MSS GPIO_2[19]             |   53  | GPIO               |
| P8_23  | MSS GPIO_2[20]             |   53  | GPIO               |
| P8_24  | MSS GPIO_2[21]             |   53  | GPIO               |
| P8_25  | MSS GPIO_2[22]             |   53  | GPIO               |
| P8_26  | MSS GPIO_2[23]             |   53  | GPIO               |
| P8_27  | MSS GPIO_2[24]             |   53  | GPIO               |
| P8_28  | MSS GPIO_2[25]             |   53  | GPIO               |
| P8_29  | MSS GPIO_2[26]             |   53  | GPIO               |
| P8_30  | MSS GPIO_2[27]             |   53  | GPIO               |
| P8_31  | core_gpio[0] @ 0x41100000  |  126  | GPIO               |
| P8_32  | core_gpio[1] @ 0x41100000  |  127  | GPIO               |
| P8_33  | Read value @ 0x41300010    |  n/a  | Encoder1[B] input  |
| P8_34  | core_gpio[3] @ 0x41100000  |  129  | GPIO               |
| P8_35  | Read value @ 0x41300010    |  n/a  |  Encoder1[A] input |
| P8_36  | core_gpio[5] @ 0x41100000  |  131  | GPIO               |
| P8_37  | core_gpio[6] @ 0x41100000  |  132  | GPIO               |
| P8_38  | core_gpio[7] @ 0x41100000  |  133  | GPIO               |
| P8_39  | core_gpio[8] @ 0x41100000  |  134  | GPIO               |
| P8_40  | core_gpio[9] @ 0x41100000  |  135  | GPIO               |
| P8_41  | core_gpio[10] @ 0x41100000 |  136  | GPIO               |
| P8_42  | core_gpio[11] @ 0x41100000 |  137  | GPIO               |
| P8_43  | core_gpio[12] @ 0x41100000 |  138  | GPIO               |
| P8_44  | core_gpio[13] @ 0x41100000 |  139  | GPIO               |
| P8_45  | core_gpio[14] @ 0x41100000 |  140  | GPIO               |
| P8_46  | core_gpio[15] @ 0x41100000 |  141  | GPIO               |

## P9 Header

| Signal | Control                    | Irq # | Description       |
|--------|----------------------------|-------|-------------------|
| P9_1   | n/a                        |  n/a  | GND               |
| P9_2   | n/a                        |  n/a  | GND               |
| P9_3   | n/a                        |  n/a  | VCC 3.3V          |
| P9_4   | n/a                        |  n/a  | VCC 3.3V          |
| P9_5   | n/a                        |  n/a  | VDD 5V            |
| P9_6   | n/a                        |  n/a  | VDD 5V            |
| P9_7   | n/a                        |  n/a  | SYS 5V            |
| P9_8   | n/a                        |  n/a  | SYS 5V            |
| P9_9   | n/a                        |  n/a  | NC                |
| P9_10  | n/a                        |  n/a  | SYS_RSTN          |
| P9_11  |                            |       |                   |
| P9_12  | core_gpio[0] @ 0x41200000  |  142  | GPIO              |
| P9_13  | core_gpio[7] @ 0x41200000  |  149  | GPIO              |
| P9_14  | core_pwm[0] @ 0x41400000   |  n/a  | PWM_1:0           |
| P9_15  | core_gpio[1] @ 0x41200000  |  143  | GPIO              |
| P9_16  | core_pwm[1] @ 0x41400000   |  n/a  | PWM_1:1           |
| P9_17  |                            |       |                   |
| P9_18  |                            |       |                   |
| P9_19  | MSS I2C0                   |   58  | I2C0 SCL          |
| P9_20  | MSS I2C0                   |   58  | I2C0 SDA          |
| P9_21  |                            |       |                   |
| P9_22  |                            |       |                   |
| P9_23  | core_gpio[2] @ 0x41200000  |  144  | GPIO              |
| P9_24  |                            |       |                   |
| P9_25  | core_gpio[3] @ 0x41200000  |  145  | GPIO              |
| P9_26  |                            |       |                   |
| P9_27  | Read value @ 0x41300000    |  n/a  | Encoder0[B] input |
| P9_28  |                            |       |                   |
| P9_29  |                            |       |                   |
| P9_30  | core_gpio[5] @ 0x41200000  |  147  | GPIO              |
| P9_31  |                            |       |                   |
| P9_32  | n/a                        |  n/a  | VDD ADC           |
| P9_33  | n/a                        |  n/a  | ADC input 4       |
| P9_34  | n/a                        |  n/a  | AGND              |
| P9_35  | n/a                        |  n/a  | ADC input 6       |
| P9_36  | n/a                        |  n/a  | ADC input 5       |
| P9_37  | n/a                        |  n/a  | ADC input 2       |
| P9_38  | n/a                        |  n/a  | ADC input 3       |
| P9_39  | n/a                        |  n/a  | ADC input 0       |
| P9_40  | n/a                        |  n/a  | ADC input 1       |
| P9_41  | core_gpio[6] @ 0x41200000  |  148  | GPIO              |
| P9_42  | Read value @ 0x41300000    |  n/a  | Encoder0[A] input |
| P9_43  | n/a                        |  n/a  | GND               |
| P9_44  | n/a                        |  n/a  | GND               |
| P9_45  | n/a                        |  n/a  | GND               |
| P9_46  | n/a                        |  n/a  | GND               |
