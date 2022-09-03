#===============================================================================
# Tie off and unused signals when no M.2 interface is included.
#===============================================================================

sd_mark_pins_unused -sd_name {B_V_F_BASE_DESIGN} -pin_names {BVF_RISCV_SUBSYSTEM:FIC_0_AXI4_TARGET} 
sd_mark_pins_unused -sd_name {B_V_F_BASE_DESIGN} -pin_names {BVF_RISCV_SUBSYSTEM:M2_APB_MTARGET} 
sd_connect_pins_to_constant -sd_name {B_V_F_BASE_DESIGN} -pin_names {BVF_RISCV_SUBSYSTEM:PCIE_INT_N} -value {VCC} 
#<CJ>sd_connect_pins_to_constant -sd_name {B_V_F_BASE_DESIGN} -pin_names {BVF_RISCV_SUBSYSTEM:M2_UART_RXD} -value {GND} 
#<CJ>sd_connect_pins_to_constant -sd_name {B_V_F_BASE_DESIGN} -pin_names {BVF_RISCV_SUBSYSTEM:M2_UART_CTS} -value {GND} 
#<CJ>sd_mark_pins_unused -sd_name {B_V_F_BASE_DESIGN} -pin_names {BVF_RISCV_SUBSYSTEM:M2_UART_TXD} 
#<CJ>sd_mark_pins_unused -sd_name {B_V_F_BASE_DESIGN} -pin_names {BVF_RISCV_SUBSYSTEM:M2_UART_RTS} 
sd_mark_pins_unused -sd_name {B_V_F_BASE_DESIGN} -pin_names {BVF_RISCV_SUBSYSTEM:FIC_0_AXI4_INITIATOR} 

