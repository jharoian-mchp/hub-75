puts "======== Add M.2 option: BOARD_TESTS ========"

source script_support/components/M2/BOARD_TESTS/CoreGPIO_M2.tcl

source script_support/components/M2/BOARD_TESTS/M2_INTERFACE.tcl

#-------------------------------------------------------------------------------
# Create the M.2 interface block.
# This block will be stiched up to the rest of the design in the calling script.
#-------------------------------------------------------------------------------

set sd_name ${top_level_name}

#-------------------------------------------------------------------------------

sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {M2_W_DISABLE1} 
sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {M2_W_DISABLE2} 

#-------------------------------------------------------------------------------

sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_UART_TXD} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_UART_RXD} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_UART_RTS} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_UART_CTS} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {M2_PERST0n} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {CSI1_PWND} -port_direction {OUT}

#-------------------------------------------------------------------------------

sd_instantiate_component -sd_name ${sd_name} -component_name {M2_INTERFACE} -instance_name {M2_INTERFACE_0} 

#-------------------------------------------------------------------------------
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:M2_APB_MTARGET" "M2_INTERFACE_0:APB_TARGET"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_3_PCLK" "M2_INTERFACE_0:PCLK"} 
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_3_FABRIC_RESET_N" "M2_INTERFACE_0:PRESETN"} 

sd_connect_pins -sd_name ${sd_name} -pin_names {"M2_INTERFACE_0:M2_PERST0n" "M2_PERST0n"}

sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:M2_UART_RXD" "M2_UART_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:M2_UART_TXD" "M2_UART_TXD" }

sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:PCIE_INT} -value {GND} 

sd_connect_pins -sd_name ${sd_name} -pin_names {"M2_INTERFACE_0:M2_W_DISABLE1" "M2_W_DISABLE1"} 
sd_connect_pins -sd_name ${sd_name} -pin_names {"M2_INTERFACE_0:M2_W_DISABLE2" "M2_W_DISABLE2"} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {M2_INTERFACE_0:M2_UART_WAKEN} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {M2_INTERFACE_0:M2_I2C_ALTN} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {M2_INTERFACE_0:H_M2_CLKREQ0N} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {M2_INTERFACE_0:M2_PEWAKEN} -port_name {} 

sd_connect_pins -sd_name ${sd_name} -pin_names {"M2_INTERFACE_0:M2_UART_RTS" "M2_UART_RTS"} 
sd_connect_pins -sd_name ${sd_name} -pin_names {"M2_INTERFACE_0:M2_UART_CTS" "M2_UART_CTS"} 

sd_connect_pins -sd_name ${sd_name} -pin_names {"CSI1_PWND" "M2_INTERFACE_0:CSI_PWND"} 
sd_invert_pins -sd_name ${sd_name} -pin_names {"CSI1_PWND"} 

#-------------------------------------------------------------------------------
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:M2_UART_CTS} -value {GND} 
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:M2_W_DISABLE2} 
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:M2_W_DISABLE1} 

