# Creating SmartDesign B_V_F_BASE_DESIGN
set sd_name {B_V_F_BASE_DESIGN}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_CLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_DIR} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_NXT} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_STP} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_DATA4} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_DATA5} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_DATA6} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_DATA7} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_OCn} -port_direction {IN} 

sd_create_scalar_port -sd_name ${sd_name} -port_name {UART0_TXD} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART0_RXD} -port_direction {IN}


sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB0_RESETB} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX0_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SDA} -port_direction {INOUT} -port_is_pad {1}
#sd_create_scalar_port -sd_name ${sd_name} -port_name {XCVR_0A_REFCLK_P} -port_direction {IN} -port_is_pad {1}
#sd_create_scalar_port -sd_name ${sd_name} -port_name {XCVR_0A_REFCLK_N} -port_direction {IN} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CLK_EMMC_CLK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CMD_EMMC_CMD} -port_direction {INOUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA0_EMMC_DATA0} -port_direction {INOUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA1_EMMC_DATA1} -port_direction {INOUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA2_EMMC_DATA2} -port_direction {INOUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_DATA3_EMMC_DATA3} -port_direction {INOUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_POW_EMMC_DATA4} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_SEL_EMMC_DATA5} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_EN_EMMC_DATA6} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_CMD_DIR_EMMC_DATA7} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_DIR_1_3_EMMC_UNUSED} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_VOLT_DIR_0_EMMC_UNUSED} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_CD_EMMC_STRB} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SD_WP_EMMC_RSTN} -port_direction {IN}

sd_create_bus_port -sd_name ${sd_name} -port_name {CA} -port_direction {OUT} -port_range {[5:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[31:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM} -port_direction {OUT} -port_range {[3:0]} -port_is_pad {1}

sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_19} -port_direction {INOUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {P9_20} -port_direction {INOUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART1_TXD} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART1_RXD} -port_direction {IN}

#-------------------------------------------------------------------------------
# Analog to Digital Converter pins (for cape analog inputs)
#-------------------------------------------------------------------------------
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_CSn} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_SCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_MOSI} -port_direction {INOUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_MISO} -port_direction {INOUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_IRQn} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_MCLK} -port_direction {OUT}


#-------------------------------------------------------------------------------
# Ethernet PHY top level ports
#-------------------------------------------------------------------------------
sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_RSTn} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_INTn} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_MDC} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_MDIO} -port_direction {INOUT}

#-------------------------------------------------------------------------------
# Instantiate submodules
#-------------------------------------------------------------------------------

# Add RISC-V subsystem
sd_instantiate_component -sd_name ${sd_name} -component_name {BVF_RISCV_SUBSYSTEM} -instance_name {BVF_RISCV_SUBSYSTEM}


# Add CLOCKS_AND_RESETS instance
sd_instantiate_component -sd_name ${sd_name} -component_name {CLOCKS_AND_RESETS} -instance_name {CLOCKS_AND_RESETS}


# Clocks and resets
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_0_ACLK" "BVF_RISCV_SUBSYSTEM:FIC_0_ACLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_1_ACLK" "BVF_RISCV_SUBSYSTEM:FIC_1_ACLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_2_ACLK" "BVF_RISCV_SUBSYSTEM:FIC_2_ACLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_3_PCLK" "BVF_RISCV_SUBSYSTEM:FIC_3_PCLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_0_FABRIC_RESET_N" "USB0_RESETB" "PHY_RSTn"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_3_FABRIC_RESET_N" "BVF_RISCV_SUBSYSTEM:presetn"}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CLOCKS_AND_RESETS:FIC_1_FABRIC_RESET_N}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {CLOCKS_AND_RESETS:FIC_2_FABRIC_RESET_N}


# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK" "BVF_RISCV_SUBSYSTEM:CK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK_N" "BVF_RISCV_SUBSYSTEM:CK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE" "BVF_RISCV_SUBSYSTEM:CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS" "BVF_RISCV_SUBSYSTEM:CS" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:I2C0_SDA" "P9_20"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:I2C0_SCL" "P9_19"}



sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:I2C_1_SCL" "I2C_1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:I2C_1_SDA" "I2C_1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:UART0_RXD" "UART0_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:UART0_TXD" "UART0_TXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MMUART1_RXD" "MMUART1_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MMUART1_TXD" "MMUART1_TXD" }


sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MSS_RESET_N_M2F" "CLOCKS_AND_RESETS:EXT_RST_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MSS_DLL_LOCKS" "CLOCKS_AND_RESETS:MSS_DLL_LOCKS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ODT" "BVF_RISCV_SUBSYSTEM:ODT" }


#-------------------------------------------------------------------------------
# eMMC stub
#-------------------------------------------------------------------------------d
#sd_instantiate_component -sd_name ${sd_name} -component_name {EMMC} -instance_name {EMMC_0} 
#sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {EMMC_0:EMMC_CMD} -port_name {} 
#sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {EMMC_0:EMMC_CLK} -port_name {} 
#sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {EMMC_0:EMMC_DQ} -port_name {} 
#sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {EMMC_0:EMMC_RSTn} -port_name {} 

#sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA0} -port_direction {INOUT} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA1} -port_direction {INOUT} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA2} -port_direction {INOUT} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA3} -port_direction {INOUT} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA4} -port_direction {INOUT} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA5} -port_direction {INOUT} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA6} -port_direction {INOUT} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {EMMC_DATA7} -port_direction {INOUT} 

#sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_0:EMMC_DATA0" "EMMC_DATA0"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_0:EMMC_DATA1" "EMMC_DATA1"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_0:EMMC_DATA2" "EMMC_DATA2"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_0:EMMC_DATA3" "EMMC_DATA3"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_0:EMMC_DATA4" "EMMC_DATA4"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_0:EMMC_DATA5" "EMMC_DATA5"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_0:EMMC_DATA6" "EMMC_DATA6"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"EMMC_0:EMMC_DATA7" "EMMC_DATA7"} 

#-------------------------------------------------------------------------------
# Connect ADC.
#-------------------------------------------------------------------------------
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:ADC_SCK" "ADC_SCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:ADC_CSn" "ADC_CSn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:ADC_MOSI" "ADC_MOSI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:ADC_MISO" "ADC_MISO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_IRQn" "BVF_RISCV_SUBSYSTEM:ADC_IRQn" }
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CLOCKS_AND_RESETS:ADC_MCLK_4_915MHz} -port_name {ADC_MCLK} 

#-------------------------------------------------------------------------------
#sd_connect_pins -sd_name ${sd_name} -pin_names {"XCVR_0A_REFCLK_N" "CLOCKS_AND_RESETS:XCVR_0A_REFCLK_N" }
#sd_connect_pins -sd_name ${sd_name} -pin_names {"XCVR_0A_REFCLK_P" "CLOCKS_AND_RESETS:XCVR_0A_REFCLK_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REFCLK" "BVF_RISCV_SUBSYSTEM:REFCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REFCLK_N" "BVF_RISCV_SUBSYSTEM:REFCLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_N" "BVF_RISCV_SUBSYSTEM:RESET_N" }

#-------------------------------------------------------------------------------
# Ethernet PHY connections
#-------------------------------------------------------------------------------
sd_connect_pins -sd_name ${sd_name} -pin_names {"PHY_MDIO" "BVF_RISCV_SUBSYSTEM:PHY_MDIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PHY_MDC" "BVF_RISCV_SUBSYSTEM:PHY_MDC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PHY_INTn" "BVF_RISCV_SUBSYSTEM:PHY_INTn" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_RX0_N" "BVF_RISCV_SUBSYSTEM:SGMII_RX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_RX0_P" "BVF_RISCV_SUBSYSTEM:SGMII_RX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_TX0_N" "BVF_RISCV_SUBSYSTEM:SGMII_TX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_TX0_P" "BVF_RISCV_SUBSYSTEM:SGMII_TX0_P" }

#-------------------------------------------------------------------------------
# OTG USB
#-------------------------------------------------------------------------------
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB0_OCn" "BVF_RISCV_SUBSYSTEM:USB_OCn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_CLK" "USB0_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_DATA0" "USB0_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_DATA1" "USB0_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_DATA2" "USB0_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_DATA3" "USB0_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_DATA4" "USB0_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_DATA5" "USB0_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_DATA6" "USB0_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_DATA7" "USB0_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_DIR" "USB0_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_NXT" "USB0_NXT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:USB_STP" "USB0_STP" }

#-------------------------------------------------------------------------------
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_CLK_EMMC_CLK" "BVF_RISCV_SUBSYSTEM:SD_CLK_EMMC_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_CMD_EMMC_CMD" "BVF_RISCV_SUBSYSTEM:SD_CMD_EMMC_CMD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_DATA0_EMMC_DATA0" "BVF_RISCV_SUBSYSTEM:SD_DATA0_EMMC_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_DATA1_EMMC_DATA1" "BVF_RISCV_SUBSYSTEM:SD_DATA1_EMMC_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_DATA2_EMMC_DATA2" "BVF_RISCV_SUBSYSTEM:SD_DATA2_EMMC_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_DATA3_EMMC_DATA3" "BVF_RISCV_SUBSYSTEM:SD_DATA3_EMMC_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_POW_EMMC_DATA4" "BVF_RISCV_SUBSYSTEM:SD_POW_EMMC_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_VOLT_SEL_EMMC_DATA5" "BVF_RISCV_SUBSYSTEM:SD_VOLT_SEL_EMMC_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_VOLT_EN_EMMC_DATA6" "BVF_RISCV_SUBSYSTEM:SD_VOLT_EN_EMMC_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_VOLT_CMD_DIR_EMMC_DATA7" "BVF_RISCV_SUBSYSTEM:SD_VOLT_CMD_DIR_EMMC_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_VOLT_DIR_1_3_EMMC_UNUSED" "BVF_RISCV_SUBSYSTEM:SD_VOLT_DIR_1_3_EMMC_UNUSED" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_VOLT_DIR_0_EMMC_UNUSED" "BVF_RISCV_SUBSYSTEM:SD_VOLT_DIR_0_EMMC_UNUSED" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_CD_EMMC_STRB" "BVF_RISCV_SUBSYSTEM:SD_CD_EMMC_STRB" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_WP_EMMC_RSTN" "BVF_RISCV_SUBSYSTEM:SD_WP_EMMC_RSTN" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:CA" "CA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DM" "BVF_RISCV_SUBSYSTEM:DM" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQ" "BVF_RISCV_SUBSYSTEM:DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS" "BVF_RISCV_SUBSYSTEM:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_N" "BVF_RISCV_SUBSYSTEM:DQS_N" }


#-------------------------------------------------------------------------------
# MIPI CSI-2 RX interface
#-------------------------------------------------------------------------------
#sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_C_N} -port_direction {IN} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_C_P} -port_direction {IN} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_D0_N} -port_direction {IN} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_D0_P} -port_direction {IN} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_D1_N} -port_direction {IN} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_D1_P} -port_direction {IN} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_D2_N} -port_direction {IN} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_D2_P} -port_direction {IN} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_D3_N} -port_direction {IN} 
#sd_create_scalar_port -sd_name ${sd_name} -port_name {CAM_D3_P} -port_direction {IN} 

#sd_instantiate_component -sd_name ${sd_name} -component_name {MIPI_CSI_INTERFACE} -instance_name {MIPI_CSI_INTERFACE_0} 
#sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {MIPI_CSI_INTERFACE_0:CSI1_PWND} -port_name {} 

#sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIPI_CSI_INTERFACE_0:RXD_N} -pin_slices {"[3:3]"} 
#sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIPI_CSI_INTERFACE_0:RXD_N} -pin_slices {"[2:2]"} 
#sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIPI_CSI_INTERFACE_0:RXD_N} -pin_slices {"[1:1]"} 
#sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIPI_CSI_INTERFACE_0:RXD_N} -pin_slices {"[0:0]"} 
#sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIPI_CSI_INTERFACE_0:RXD} -pin_slices {"[3:3]"} 
#sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIPI_CSI_INTERFACE_0:RXD} -pin_slices {"[2:2]"} 
#sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIPI_CSI_INTERFACE_0:RXD} -pin_slices {"[1:1]"} 
#sd_create_pin_slices -sd_name ${sd_name} -pin_name {MIPI_CSI_INTERFACE_0:RXD} -pin_slices {"[0:0]"} 

#sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_C_N" "MIPI_CSI_INTERFACE_0:RX_CLK_N"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_C_P" "MIPI_CSI_INTERFACE_0:RX_CLK_P"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_D0_P" "MIPI_CSI_INTERFACE_0:RXD[0:0]"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_D0_N" "MIPI_CSI_INTERFACE_0:RXD_N[0:0]"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_D1_P" "MIPI_CSI_INTERFACE_0:RXD[1:1]"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_D1_N" "MIPI_CSI_INTERFACE_0:RXD_N[1:1]"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_D2_N" "MIPI_CSI_INTERFACE_0:RXD_N[2:2]"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_D2_P" "MIPI_CSI_INTERFACE_0:RXD[2:2]"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_D3_P" "MIPI_CSI_INTERFACE_0:RXD[3:3]"} 
#sd_connect_pins -sd_name ${sd_name} -pin_names {"CAM_D3_N" "MIPI_CSI_INTERFACE_0:RXD_N[3:3]"} 


sd_connect_pin_to_port -sd_name {B_V_F_BASE_DESIGN} -pin_name {BVF_RISCV_SUBSYSTEM:USER_BUTTON} -port_name {}

#-------------------------------------------------------------------------------
# Unused ports.
#-------------------------------------------------------------------------------
# sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:FIC_1_AXI4_TARGET}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:FIC_2_AXI4_TARGET}

sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:HSI_APB_MTARGET}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:CSI_APB_MTARGET}


#-------------------------------------------------------------------------------

source script_support/components/CAPE/$cape_option/ADD_CAPE.tcl 
source script_support/components/M2/$m2_option/ADD_M2_INTERFACE.tcl 


#-------------------------------------------------------------------------------




# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign B_V_F_BASE_DESIGN
generate_component -component_name ${sd_name}

