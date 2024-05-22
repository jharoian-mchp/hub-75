# Creating SmartDesign "MEM_BIT_PLANE2"
set sd_name {MEM_BIT_PLANE2}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Scalar Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_a} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {clk_b} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w_en_a} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {w_en_b} -port_direction {IN}


# Create top level Bus Ports
sd_create_bus_port -sd_name ${sd_name} -port_name {addr_a} -port_direction {IN} -port_range {[13:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {addr_b} -port_direction {IN} -port_range {[13:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w_data_a} -port_direction {IN} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {w_data_b} -port_direction {IN} -port_range {[0:0]}

sd_create_bus_port -sd_name ${sd_name} -port_name {r_data_a} -port_direction {OUT} -port_range {[0:0]}
sd_create_bus_port -sd_name ${sd_name} -port_name {r_data_b} -port_direction {OUT} -port_range {[0:0]}


# Add PF_DPSRAM_C0_0 instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_DPSRAM_C0} -instance_name {PF_DPSRAM_C0_0}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DPSRAM_C0_0:A_CLK" "clk_a" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DPSRAM_C0_0:A_DIN" "w_data_a" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DPSRAM_C0_0:A_DOUT" "r_data_a" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DPSRAM_C0_0:A_WEN" "w_en_a" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DPSRAM_C0_0:B_CLK" "clk_b" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DPSRAM_C0_0:B_DIN" "w_data_b" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DPSRAM_C0_0:B_DOUT" "r_data_b" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DPSRAM_C0_0:B_WEN" "w_en_b" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DPSRAM_C0_0:A_ADDR" "addr_a" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_DPSRAM_C0_0:B_ADDR" "addr_b" }


# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the SmartDesign 
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign "MEM_BIT_PLANE2"
generate_component -component_name ${sd_name}
