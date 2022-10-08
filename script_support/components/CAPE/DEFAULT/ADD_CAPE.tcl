#-------------------------------------------------------------------------------
# Build cape's submodules
#-------------------------------------------------------------------------------
source script_support/components/CAPE/DEFAULT/APB_BUS_CONVERTER.tcl
source script_support/components/CAPE/DEFAULT/P8_GPIO_LCD.tcl
source script_support/components/CAPE/DEFAULT/CAPE_DEFAULT_GPIOS.tcl
source script_support/components/CAPE/DEFAULT/CAPE_PWM.tcl
source script_support/components/CAPE/DEFAULT/CAPE.tcl

#-------------------------------------------------------------------------------
# Build the Cape module
#-------------------------------------------------------------------------------
set sd_name {B_V_F_BASE_DESIGN}

#-------------------------------------------------------------------------------
# Cape pins
#-------------------------------------------------------------------------------
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_19} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_11} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_13} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_14} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_16} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_42} -port_direction {OUT}

#-------------------------------------------------------------------------------
# Instantiate.
#-------------------------------------------------------------------------------

sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE} -instance_name {CAPE}

#-------------------------------------------------------------------------------
# Connections.
#-------------------------------------------------------------------------------

# Clocks and resets
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_3_PCLK" "CAPE:PCLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_3_FABRIC_RESET_N" "CAPE:PRESETN" }


sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MMUART_4_TXD" "P9_13"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MMUART_4_RXD" "P9_11"}

# Connect Default Cape GPIOs
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[7]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[9]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[10]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[11]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[12]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[13]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[14]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[15]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[17]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OE} -pin_slices {[18]}


sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[0:0]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_0"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[1:1]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_1"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[2:2]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_2"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[3:3]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_3"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[4:4]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_4"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[5:5]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_5"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[6:6]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_6"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[7:7]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_7"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[8:8]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_8"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[9:9]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_9"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[10:10]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_10"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[11:11]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_11"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[12:12]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_12"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[13:13]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_13"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[14:14]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_14"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[15:15]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_15"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[16:16]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_16"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[17:17]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_17"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OE[18:18]" "BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F_18"}


sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[7]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[9]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[10]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[11]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[12]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[13]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[14]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[15]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[17]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_OUT} -pin_slices {[18]}


sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[0:0]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_0"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[1:1]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_1"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[2:2]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_2"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[3:3]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_3"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[4:4]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_4"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[5:5]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_5"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[6:6]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_6"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[7:7]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_7"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[8:8]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_8"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[9:9]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_9"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[10:10]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_10"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[11:11]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_11"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[12:12]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_12"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[13:13]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_13"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[14:14]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_14"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[15:15]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_15"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[16:16]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_16"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[17:17]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_17"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_OUT[18:18]" "BVF_RISCV_SUBSYSTEM:GPIO_2_M2F_18"}


sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[6]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[7]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[8]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[9]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[10]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[11]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[12]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[13]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[14]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[15]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[16]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[17]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:GPIO_IN} -pin_slices {[18]}


sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[0:0]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_0"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[1:1]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_1"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[2:2]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_2"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[3:3]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_3"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[4:4]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_4"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[5:5]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_5"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[6:6]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_6"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[7:7]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_7"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[8:8]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_8"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[9:9]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_9"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[10:10]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_10"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[11:11]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_11"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[12:12]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_12"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[13:13]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_13"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[14:14]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_14"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[15:15]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_15"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[16:16]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_16"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[17:17]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_17"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:GPIO_IN[18:18]" "BVF_RISCV_SUBSYSTEM:GPIO_2_F2M_18"}

sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P8_19" "P8_19"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_14" "P9_14"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_16" "P9_16"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_42" "P9_42"}

sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:APB_SLAVE" "BVF_RISCV_SUBSYSTEM:CAPE_APB_MTARGET"}

