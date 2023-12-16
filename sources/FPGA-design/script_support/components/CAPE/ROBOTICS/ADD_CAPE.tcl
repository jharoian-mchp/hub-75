puts "======== Add cape option: ROBOTICS ========"

#-------------------------------------------------------------------------------
# Import HDL source files
#-------------------------------------------------------------------------------
import_files -hdl_source {script_support/components/CAPE/ROBOTICS/HDL/apb_rotary_enc.v}
import_files -hdl_source {script_support/components/CAPE/ROBOTICS/HDL/debounce.v}
import_files -hdl_source {script_support/components/CAPE/ROBOTICS/HDL/rotary_encoder.v}

build_design_hierarchy
create_hdl_core -file $project_dir/hdl/apb_rotary_enc.v -module {apb_rotary_enc} -library {work} -package {}


hdl_core_add_bif -hdl_core_name {apb_rotary_enc} -bif_definition {APB:AMBA:AMBA2:slave} -bif_name {BIF_1} -signal_map {} 
hdl_core_assign_bif_signal -hdl_core_name {apb_rotary_enc} -bif_name {BIF_1} -bif_signal_name {PADDR} -core_signal_name {paddr} 
hdl_core_assign_bif_signal -hdl_core_name {apb_rotary_enc} -bif_name {BIF_1} -bif_signal_name {PENABLE} -core_signal_name {penable} 
hdl_core_assign_bif_signal -hdl_core_name {apb_rotary_enc} -bif_name {BIF_1} -bif_signal_name {PWRITE} -core_signal_name {pwrite} 
hdl_core_assign_bif_signal -hdl_core_name {apb_rotary_enc} -bif_name {BIF_1} -bif_signal_name {PRDATA} -core_signal_name {prdata} 
hdl_core_assign_bif_signal -hdl_core_name {apb_rotary_enc} -bif_name {BIF_1} -bif_signal_name {PWDATA} -core_signal_name {pwdata} 
hdl_core_assign_bif_signal -hdl_core_name {apb_rotary_enc} -bif_name {BIF_1} -bif_signal_name {PREADY} -core_signal_name {pready} 
hdl_core_assign_bif_signal -hdl_core_name {apb_rotary_enc} -bif_name {BIF_1} -bif_signal_name {PSLVERR} -core_signal_name {pslverr} 
hdl_core_assign_bif_signal -hdl_core_name {apb_rotary_enc} -bif_name {BIF_1} -bif_signal_name {PSELx} -core_signal_name {psel} 
hdl_core_rename_bif -hdl_core_name {apb_rotary_enc} -current_bif_name {BIF_1} -new_bif_name {APB_TARGET} 

#-------------------------------------------------------------------------------
# Build cape's submodules
#-------------------------------------------------------------------------------
source script_support/components/CAPE/ROBOTICS/APB_BUS_CONVERTER.tcl
source script_support/components/CAPE/ROBOTICS/CoreAPB3_CAPE.tcl
source script_support/components/CAPE/ROBOTICS/CoreGPIO_P8_UPPER.tcl
source script_support/components/CAPE/ROBOTICS/P8_GPIO_UPPER.tcl
source script_support/components/CAPE/ROBOTICS/CAPE_DEFAULT_GPIOS.tcl
source script_support/components/CAPE/ROBOTICS/corepwm_C1.tcl
source script_support/components/CAPE/ROBOTICS/CAPE_PWM.tcl
source script_support/components/CAPE/ROBOTICS/CoreGPIO_P9.tcl
source script_support/components/CAPE/ROBOTICS/P9_GPIO.tcl
source script_support/components/CAPE/ROBOTICS/CAPE.tcl

#-------------------------------------------------------------------------------
# Build the Cape module
#-------------------------------------------------------------------------------
set sd_name ${top_level_name}

#-------------------------------------------------------------------------------
# Cape pins
#-------------------------------------------------------------------------------
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN13_USER_LED_10} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P8_PIN19} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_11} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_13} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN14} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_PIN16} -port_direction {OUT}

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

sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:GPIO_2_F2M" "CAPE:GPIO_IN"} 
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:GPIO_2_M2F" "CAPE:GPIO_OUT"} 
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F" "CAPE:GPIO_OE"} 

sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P8_PIN13_USER_LED_10" "P8_PIN13_USER_LED_10"}

sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P8_PIN19" "P8_PIN19"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_PIN14" "P9_PIN14"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:P9_PIN16" "P9_PIN16"}

sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_PIN27} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_PIN35} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_PIN33} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_PIN42} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_PIN11} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_PIN12} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_PIN15} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8_PIN16} -port_name {} 

sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:APB_SLAVE" "BVF_RISCV_SUBSYSTEM:CAPE_APB_MTARGET"}

sd_delete_ports -sd_name ${sd_name} -port_names {P9_13} 
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MMUART_4_TXD} 

sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M_C} 
sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M_A} 
sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M_B} 
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MSS_INT_F2M_A" "CAPE:INT_A"} 
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MSS_INT_F2M_B" "CAPE:INT_B"} 
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MSS_INT_F2M_C" "CAPE:INT_C"} 
