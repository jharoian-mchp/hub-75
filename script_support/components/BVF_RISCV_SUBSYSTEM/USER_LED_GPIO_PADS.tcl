create_smartdesign -sd_name {USER_LED_PADS} 
sd_instantiate_macro -sd_name {USER_LED_PADS} -macro_name {BIBUF} -instance_name {BIBUF_0} 
sd_instantiate_macro -sd_name {USER_LED_PADS} -macro_name {BIBUF} -instance_name {BIBUF_1} 
sd_instantiate_macro -sd_name {USER_LED_PADS} -macro_name {BIBUF} -instance_name {BIBUF_2} 
sd_instantiate_macro -sd_name {USER_LED_PADS} -macro_name {BIBUF} -instance_name {BIBUF_3} 
sd_instantiate_macro -sd_name {USER_LED_PADS} -macro_name {BIBUF} -instance_name {BIBUF_4} 
sd_instantiate_macro -sd_name {USER_LED_PADS} -macro_name {BIBUF} -instance_name {BIBUF_5} 
sd_instantiate_macro -sd_name {USER_LED_PADS} -macro_name {BIBUF} -instance_name {BIBUF_6} 
sd_instantiate_macro -sd_name {USER_LED_PADS} -macro_name {BIBUF} -instance_name {BIBUF_7} 
sd_instantiate_macro -sd_name {USER_LED_PADS} -macro_name {BIBUF} -instance_name {BIBUF_8} 
sd_instantiate_macro -sd_name {USER_LED_PADS} -macro_name {BIBUF} -instance_name {BIBUF_9} 
sd_instantiate_macro -sd_name {USER_LED_PADS} -macro_name {BIBUF} -instance_name {BIBUF_10} 
sd_instantiate_macro -sd_name {USER_LED_PADS} -macro_name {BIBUF} -instance_name {BIBUF_11} 

sd_create_bus_port -sd_name {USER_LED_PADS} -port_name {USER_LED_GPIO_OUT} -port_direction {IN} -port_range {[11:0]} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OUT} -pin_slices {"[11:11]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OUT} -pin_slices {"[10:10]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OUT} -pin_slices {"[9:9]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OUT} -pin_slices {"[8:8]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OUT} -pin_slices {"[7:7]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OUT} -pin_slices {"[6:6]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OUT} -pin_slices {"[5:5]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OUT} -pin_slices {"[4:4]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OUT} -pin_slices {"[3:3]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OUT} -pin_slices {"[2:2]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OUT} -pin_slices {"[1:1]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OUT} -pin_slices {"[0:0]"} 


sd_create_bus_port -sd_name {USER_LED_PADS} -port_name {USER_LED_GPIO_OE} -port_direction {IN} -port_range {[11:0]} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OE} -pin_slices {"[11:11]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OE} -pin_slices {"[10:10]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OE} -pin_slices {"[9:9]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OE} -pin_slices {"[8:8]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OE} -pin_slices {"[7:7]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OE} -pin_slices {"[6:6]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OE} -pin_slices {"[5:5]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OE} -pin_slices {"[4:4]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OE} -pin_slices {"[3:3]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OE} -pin_slices {"[2:2]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OE} -pin_slices {"[1:1]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_OE} -pin_slices {"[0:0]"} 

sd_create_bus_port -sd_name {USER_LED_PADS} -port_name {USER_LED_GPIO_IN} -port_direction {OUT} -port_range {[11:0]} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_IN} -pin_slices {"[11:11]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_IN} -pin_slices {"[10:10]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_IN} -pin_slices {"[9:9]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_IN} -pin_slices {"[8:8]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_IN} -pin_slices {"[7:7]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_IN} -pin_slices {"[6:6]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_IN} -pin_slices {"[5:5]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_IN} -pin_slices {"[4:4]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_IN} -pin_slices {"[3:3]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_IN} -pin_slices {"[2:2]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_IN} -pin_slices {"[1:1]"} 
sd_create_pin_slices -sd_name {USER_LED_PADS} -pin_name {USER_LED_GPIO_IN} -pin_slices {"[0:0]"} 

sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_0:D" "USER_LED_GPIO_OUT[0:0]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_0:E" "USER_LED_GPIO_OE[0:0]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_0:Y" "USER_LED_GPIO_IN[0:0]"} 

sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_1:D" "USER_LED_GPIO_OUT[1:1]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_1:E" "USER_LED_GPIO_OE[1:1]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_1:Y" "USER_LED_GPIO_IN[1:1]"} 

sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_2:D" "USER_LED_GPIO_OUT[2:2]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_2:E" "USER_LED_GPIO_OE[2:2]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_2:Y" "USER_LED_GPIO_IN[2:2]"} 

sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_3:D" "USER_LED_GPIO_OUT[3:3]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_3:E" "USER_LED_GPIO_OE[3:3]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_3:Y" "USER_LED_GPIO_IN[3:3]"} 

sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_4:D" "USER_LED_GPIO_OUT[4:4]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_4:E" "USER_LED_GPIO_OE[4:4]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_4:Y" "USER_LED_GPIO_IN[4:4]"} 

sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_5:D" "USER_LED_GPIO_OUT[5:5]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_5:E" "USER_LED_GPIO_OE[5:5]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_5:Y" "USER_LED_GPIO_IN[5:5]"} 

sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_6:D" "USER_LED_GPIO_OUT[6:6]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_6:E" "USER_LED_GPIO_OE[6:6]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_6:Y" "USER_LED_GPIO_IN[6:6]"} 

sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_7:D" "USER_LED_GPIO_OUT[7:7]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_7:E" "USER_LED_GPIO_OE[7:7]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_7:Y" "USER_LED_GPIO_IN[7:7]"} 

sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_8:D" "USER_LED_GPIO_OUT[8:8]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_8:E" "USER_LED_GPIO_OE[8:8]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_8:Y" "USER_LED_GPIO_IN[8:8]"} 

sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_9:D" "USER_LED_GPIO_OUT[9:9]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_9:E" "USER_LED_GPIO_OE[9:9]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_9:Y" "USER_LED_GPIO_IN[9:9]"} 

sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_10:D" "USER_LED_GPIO_OUT[10:10]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_10:E" "USER_LED_GPIO_OE[:10]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_10:Y" "USER_LED_GPIO_IN[10:10]"} 

sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_11:D" "USER_LED_GPIO_OUT[11:11]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_11:E" "USER_LED_GPIO_OE[11:11]"} 
sd_connect_pins -sd_name {USER_LED_PADS} -pin_names {"BIBUF_11:Y" "USER_LED_GPIO_IN[11:11]"} 

sd_rename_port -sd_name {USER_LED_PADS} -current_port_name {PAD} -new_port_name {P8_PIN3_USER_LED_0} 
sd_rename_port -sd_name {USER_LED_PADS} -current_port_name {PAD_0} -new_port_name {P8_PIN4_USER_LED_1} 
sd_rename_port -sd_name {USER_LED_PADS} -current_port_name {PAD_1} -new_port_name {P8_PIN5_USER_LED_2} 
sd_rename_port -sd_name {USER_LED_PADS} -current_port_name {PAD_2} -new_port_name {P8_PIN6_USER_LED_3} 
sd_rename_port -sd_name {USER_LED_PADS} -current_port_name {PAD_3} -new_port_name {P8_PIN7_USER_LED_4} 
sd_rename_port -sd_name {USER_LED_PADS} -current_port_name {PAD_4} -new_port_name {P8_PIN8_USER_LED_5} 
sd_rename_port -sd_name {USER_LED_PADS} -current_port_name {PAD_5} -new_port_name {P8_PIN9_USER_LED_6} 
sd_rename_port -sd_name {USER_LED_PADS} -current_port_name {PAD_6} -new_port_name {P8_PIN10_USER_LED_7} 
sd_rename_port -sd_name {USER_LED_PADS} -current_port_name {PAD_7} -new_port_name {P8_PIN11_USER_LED_8} 
sd_rename_port -sd_name {USER_LED_PADS} -current_port_name {PAD_8} -new_port_name {P8_PIN12_USER_LED_9} 
sd_rename_port -sd_name {USER_LED_PADS} -current_port_name {PAD_9} -new_port_name {P8_PIN13_USER_LED_10} 
sd_rename_port -sd_name {USER_LED_PADS} -current_port_name {PAD_10} -new_port_name {P8_PIN14_USER_LED_11} 

generate_component -component_name {USER_LED_PADS} -recursive 0 

save_smartdesign -sd_name {USER_LED_PADS} 
