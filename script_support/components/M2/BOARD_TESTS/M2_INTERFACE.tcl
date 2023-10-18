# Creating SmartDesign M2_INTERFACE
set sd_name {M2_INTERFACE}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_TARGET_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_TARGET_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_TARGET_PWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PRESETN} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_TARGET_PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_TARGET_PSLVERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CSI_PWND} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {H_M2_CLKREQ0N} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_I2C_ALTN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_PERST0n} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_PEWAKEN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_UART_CTS} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_UART_RTS} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_UART_WAKEN} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_W_DISABLE1} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_W_DISABLE2} -port_direction {OUT}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_TARGET_PADDR} -port_direction {IN} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_TARGET_PWDATA} -port_direction {IN} -port_range {[31:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APB_TARGET_PRDATA} -port_direction {OUT} -port_range {[31:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {APB_TARGET} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:APB_TARGET_PADDR" \
"PSELx:APB_TARGET_PSEL" \
"PENABLE:APB_TARGET_PENABLE" \
"PWRITE:APB_TARGET_PWRITE" \
"PRDATA:APB_TARGET_PRDATA" \
"PWDATA:APB_TARGET_PWDATA" \
"PREADY:APB_TARGET_PREADY" \
"PSLVERR:APB_TARGET_PSLVERR" } 

# Add CoreGPIO_M2_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreGPIO_M2} -instance_name {CoreGPIO_M2_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_IN} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_IN} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_IN} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_IN} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_IN} -pin_slices {[4:4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_IN} -pin_slices {[5:5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_IN} -pin_slices {[6:6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_IN} -pin_slices {[7:7]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_IN} -pin_slices {[8:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_IN} -pin_slices {[9:9]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_OUT} -pin_slices {[0:0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_OUT} -pin_slices {[1:1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_OUT} -pin_slices {[2:2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_OUT} -pin_slices {[3:3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_OUT} -pin_slices {[4:4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_OUT} -pin_slices {[5:5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_OUT} -pin_slices {[6:6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_OUT} -pin_slices {[7:7]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_OUT} -pin_slices {[8:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CoreGPIO_M2_0:GPIO_OUT} -pin_slices {[9:9]}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_M2_0:INT}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CoreGPIO_M2_0:GPIO_OE}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI_PWND" "CoreGPIO_M2_0:GPIO_IN[9:9]" "CoreGPIO_M2_0:GPIO_OUT[9:9]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_M2_0:GPIO_IN[0:0]" "CoreGPIO_M2_0:GPIO_OUT[0:0]" "M2_PERST0n" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_M2_0:GPIO_IN[1:1]" "CoreGPIO_M2_0:GPIO_OUT[1:1]" "M2_UART_WAKEN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_M2_0:GPIO_IN[2:2]" "CoreGPIO_M2_0:GPIO_OUT[2:2]" "M2_W_DISABLE1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_M2_0:GPIO_IN[3:3]" "CoreGPIO_M2_0:GPIO_OUT[3:3]" "M2_W_DISABLE2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_M2_0:GPIO_IN[4:4]" "CoreGPIO_M2_0:GPIO_OUT[4:4]" "H_M2_CLKREQ0N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_M2_0:GPIO_IN[5:5]" "CoreGPIO_M2_0:GPIO_OUT[5:5]" "M2_PEWAKEN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_M2_0:GPIO_IN[6:6]" "CoreGPIO_M2_0:GPIO_OUT[6:6]" "M2_I2C_ALTN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_M2_0:GPIO_IN[7:7]" "CoreGPIO_M2_0:GPIO_OUT[7:7]" "M2_UART_RTS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_M2_0:GPIO_IN[8:8]" "CoreGPIO_M2_0:GPIO_OUT[8:8]" "M2_UART_CTS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_M2_0:PCLK" "PCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreGPIO_M2_0:PRESETN" "PRESETN" }


# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_TARGET" "CoreGPIO_M2_0:APB_bif" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign M2_INTERFACE
generate_component -component_name ${sd_name}
