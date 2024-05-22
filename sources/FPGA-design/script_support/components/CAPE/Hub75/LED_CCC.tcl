# Creating SmartDesign "LED_CCC"
set sd_name {LED_CCC}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {led_clk} -port_direction {OUT}



# Add PF_CCC_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_CCC_C0} -instance_name {PF_CCC_C0_0}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_CCC_C0_0:PLL_POWERDOWN_N_0} -value {VCC}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:OUT0_FABCLK_0" "led_clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_CCC_C0_0:REF_CLK_0" "clk" }



# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "LED_CCC"
generate_component -component_name ${sd_name}
