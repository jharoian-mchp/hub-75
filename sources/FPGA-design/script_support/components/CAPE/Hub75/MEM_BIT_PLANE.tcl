# Creating SmartDesign "MEM_BIT_PLANE"
set sd_name {MEM_BIT_PLANE}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w_en} -port_direction {IN}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {r_addr} -port_direction {IN} -port_range {[13:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w_addr} -port_direction {IN} -port_range {[13:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w_data} -port_direction {IN} -port_range {[0:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {r_data} -port_direction {OUT} -port_range {[0:0]}


# Add PF_TPSRAM_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_TPSRAM_C0} -instance_name {PF_TPSRAM_C0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TPSRAM_C0_0:CLK" "clk" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TPSRAM_C0_0:R_DATA" "r_data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TPSRAM_C0_0:W_DATA" "w_data" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TPSRAM_C0_0:W_EN" "w_en" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TPSRAM_C0_0:R_ADDR" "r_addr" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_TPSRAM_C0_0:W_ADDR" "w_addr" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "MEM_BIT_PLANE"
generate_component -component_name ${sd_name}
