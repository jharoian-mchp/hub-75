puts "======== Add MIPI CSI option: IMX219_PHY_TEST ========"

auto_promote_pad_pins -promote_all 1

source script_support/components/MIPI_CSI/IMX219_PHY_TEST/CAM_IOD_TIP_TOP/PF_IOD_GENERIC_RX_C0.tcl
source script_support/components/MIPI_CSI/IMX219_PHY_TEST/CAM_IOD_TIP_TOP/CORERESET_PF_C1.tcl
source script_support/components/MIPI_CSI/IMX219_PHY_TEST/CAM_IOD_TIP_TOP/CORERXIODBITALIGN_C1.tcl
source script_support/components/MIPI_CSI/IMX219_PHY_TEST/CAM_IOD_TIP_TOP/CAM_IOD_TIP_TOP.tcl

source script_support/components/MIPI_CSI/IMX219_PHY_TEST/CORERESET_PF_C2.tcl
source script_support/components/MIPI_CSI/IMX219_PHY_TEST/PF_CCC_C2.tcl
source script_support/components/MIPI_CSI/IMX219_PHY_TEST/mipicsi2rxdecoderPF_C0.tcl
source script_support/components/MIPI_CSI/IMX219_PHY_TEST/CoreGPIO_MIPI_CSI.tcl
source script_support/components/MIPI_CSI/IMX219_PHY_TEST/IMX219_IF_TOP.tcl


set sd_name ${top_level_name}

#sd_create_scalar_port -sd_name ${sd_name} -port_name {CSI1_PWND} -port_direction {OUT}

sd_instantiate_component -sd_name ${sd_name} -component_name {IMX219_IF_TOP} -instance_name {IMX219_IF_TOP_0} 

sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:DEVICE_INIT_DONE" "IMX219_IF_TOP_0:INIT_DONE"} 

#sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {CSI1_PWND} -value {VCC}

sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_3_PCLK" "IMX219_IF_TOP_0:PCLK"} 
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_3_FABRIC_RESET_N" "IMX219_IF_TOP_0:PRESETN"} 
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:CSI_APB_MTARGET" "IMX219_IF_TOP_0:APB_TARGET"} 

sd_mark_pins_unused -sd_name ${sd_name} -pin_names {IMX219_IF_TOP_0:CAMCLK_RESET_N} 
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {IMX219_IF_TOP_0:CAMERA_CLK} 
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {IMX219_IF_TOP_0:FRAME_START} 
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {IMX219_IF_TOP_0:FRAME_VALID} 
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {IMX219_IF_TOP_0:LINE_VALID} 
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {IMX219_IF_TOP_0:PARALLEL_CLOCK} 

sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {IMX219_IF_TOP_0:TRNG_RST_N} -value {VCC} 

