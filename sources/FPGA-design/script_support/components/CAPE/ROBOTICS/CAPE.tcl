# Creating SmartDesign "CAPE"
set sd_name {CAPE}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PENABLE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PSEL} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PWRITE} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN33} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN35} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN27} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN42} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN11} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN12} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN15} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN16} -port_direction {IN}


sd_create_scalar_port -sd_name ${sd_name} -port_name {PCLK} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PRESETN} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PREADY} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PSLVERR} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN13_USER_LED_10} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN19} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN14} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN16} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN10_USER_LED_7} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN14_USER_LED_11} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN17} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN18} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN20} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN21} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN22} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN23} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN24} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN25} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN26} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN27} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN28} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN29} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN30} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN31} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN32} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN34} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN36} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN37} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN38} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN39} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN3_USER_LED_0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN40} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN41} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN42} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN43} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN44} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN45} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN46} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN4_USER_LED_1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN5_USER_LED_2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN6_USER_LED_3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN7_USER_LED_4} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN8_USER_LED_5} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN9_USER_LED_6} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN12} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN13} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN15} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN23} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN25} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN30} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN41} -port_direction {INOUT} -port_is_pad {1}

# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PADDR} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PWDATA} -port_direction {IN} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_OE} -port_direction {IN} -port_range {[27:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_OUT} -port_direction {IN} -port_range {[27:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {APB_SLAVE_SLAVE_PRDATA} -port_direction {OUT} -port_range {[31:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {GPIO_IN} -port_direction {OUT} -port_range {[27:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {INT_A} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {INT_B} -port_direction {OUT} -port_range {[7:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {INT_C} -port_direction {OUT} -port_range {[7:0]}


# Create top level Bus interface Ports
sd_create_bif_port -sd_name ${sd_name} -port_name {APB_SLAVE} -port_bif_vlnv {AMBA:AMBA2:APB:r0p0} -port_bif_role {slave} -port_bif_mapping {\
"PADDR:APB_SLAVE_SLAVE_PADDR" \
"PSELx:APB_SLAVE_SLAVE_PSEL" \
"PENABLE:APB_SLAVE_SLAVE_PENABLE" \
"PWRITE:APB_SLAVE_SLAVE_PWRITE" \
"PRDATA:APB_SLAVE_SLAVE_PRDATA" \
"PWDATA:APB_SLAVE_SLAVE_PWDATA" \
"PREADY:APB_SLAVE_SLAVE_PREADY" \
"PSLVERR:APB_SLAVE_SLAVE_PSLVERR" } 

# Add APB_BUS_CONVERTER_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {APB_BUS_CONVERTER} -instance_name {APB_BUS_CONVERTER_0}



# Add apb_rotary_enc_0 instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {apb_rotary_enc} -instance_name {apb_rotary_enc_0}



# Add CAPE_DEFAULT_GPIOS instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE_DEFAULT_GPIOS} -instance_name {CAPE_DEFAULT_GPIOS}



# Add CoreAPB3_CAPE_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CoreAPB3_CAPE} -instance_name {CoreAPB3_CAPE_0}



# Add P8_GPIO_UPPER_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {P8_GPIO_UPPER} -instance_name {P8_GPIO_UPPER_0}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8_GPIO_UPPER_0:INT} -pin_slices {[15:8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P8_GPIO_UPPER_0:INT} -pin_slices {[7:0]}



# Add P9_GPIO_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {P9_GPIO} -instance_name {P9_GPIO_0}



# Add PWM_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE_PWM} -instance_name {PWM_0}



# Add PWM_1 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE_PWM} -instance_name {PWM_1}



# Add scalar net connections
sd_create_scalar_net -sd_name ${sd_name} -net_name {P9_12}
sd_create_scalar_net -sd_name ${sd_name} -net_name {P9_PIN15}
sd_connect_net_to_pins -sd_name ${sd_name} -net_name {P9_12} -pin_names {"P9_GPIO_0:PAD" "P9_PIN12" }
sd_connect_net_to_pins -sd_name ${sd_name} -net_name {P9_PIN15} -pin_names {"P9_GPIO_0:PAD_5" "P9_PIN41" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_0_PAD" "P8_PIN3_USER_LED_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_11_PAD" "P8_PIN14_USER_LED_11" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_14_PAD" "P8_PIN17" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_15_PAD" "P8_PIN18" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_17_PAD" "P8_PIN20" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_18_PAD" "P8_PIN21" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_19_PAD" "P8_PIN22" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_1_PAD" "P8_PIN4_USER_LED_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_20_PAD" "P8_PIN23" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_21_PAD" "P8_PIN24" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_22_PAD" "P8_PIN25" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_23_PAD" "P8_PIN26" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_24_PAD" "P8_PIN27" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_25_PAD" "P8_PIN28" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_26_PAD" "P8_PIN29" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_27_PAD" "P8_PIN30" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_2_PAD" "P8_PIN5_USER_LED_2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_3_PAD" "P8_PIN6_USER_LED_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_4_PAD" "P8_PIN7_USER_LED_4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_5_PAD" "P8_PIN8_USER_LED_5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_6_PAD" "P8_PIN9_USER_LED_6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_7_PAD" "P8_PIN10_USER_LED_7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_0_PAD" "P8_PIN31" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_10_PAD" "P8_PIN41" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_11_PAD" "P8_PIN42" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_12_PAD" "P8_PIN43" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_13_PAD" "P8_PIN44" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_14_PAD" "P8_PIN45" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_15_PAD" "P8_PIN46" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_1_PAD" "P8_PIN32" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_3_PAD" "P8_PIN34" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_5_PAD" "P8_PIN36" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_6_PAD" "P8_PIN37" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_7_PAD" "P8_PIN38" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_8_PAD" "P8_PIN39" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:GPIO_9_PAD" "P8_PIN40" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:PCLK" "P9_GPIO_0:PCLK" "PCLK" "PWM_0:PCLK" "PWM_1:PCLK" "apb_rotary_enc_0:pclk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_GPIO_UPPER_0:PRESETN" "P9_GPIO_0:PRESETN" "PRESETN" "PWM_0:PRESETN" "PWM_1:PRESETN" "apb_rotary_enc_0:presetn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_PIN13_USER_LED_10" "PWM_1:PWM_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_PIN19" "PWM_1:PWM_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_PIN33" "apb_rotary_enc_0:enc1_b" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_PIN35" "apb_rotary_enc_0:enc1_a" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:PAD_0" "P9_PIN15" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:PAD_1" "P9_PIN23" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:PAD_2" "P9_PIN25" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:PAD_4" "P9_PIN30" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_GPIO_0:PAD_6" "P9_PIN13" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_PIN14" "PWM_0:PWM_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_PIN16" "PWM_0:PWM_1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_PIN27" "apb_rotary_enc_0:enc0_b" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P9_PIN42" "apb_rotary_enc_0:enc0_a" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_PIN11" "apb_rotary_enc_0:enc2_b" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_PIN12" "apb_rotary_enc_0:enc2_a" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_PIN15" "apb_rotary_enc_0:enc3_b" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"P8_PIN16" "apb_rotary_enc_0:enc3_a" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_IN" "GPIO_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_OE" "GPIO_OE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE_DEFAULT_GPIOS:GPIO_OUT" "GPIO_OUT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INT_A" "P8_GPIO_UPPER_0:INT[7:0]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INT_B" "P8_GPIO_UPPER_0:INT[15:8]" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"INT_C" "P9_GPIO_0:INT" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_BUS_CONVERTER_0:APB_MASTER" "CoreAPB3_CAPE_0:APB3mmaster" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_BUS_CONVERTER_0:APB_SLAVE" "APB_SLAVE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave1" "P8_GPIO_UPPER_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave2" "P9_GPIO_0:APB_bif" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave3" "apb_rotary_enc_0:APB_TARGET" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave4" "PWM_0:APBslave" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CoreAPB3_CAPE_0:APBmslave5" "PWM_1:APBslave" }

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "CAPE"
generate_component -component_name ${sd_name}
