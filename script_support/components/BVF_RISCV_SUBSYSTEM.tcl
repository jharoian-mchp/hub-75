# Creating SmartDesign BVF_RISCV_SUBSYSTEM
set sd_name {BVF_RISCV_SUBSYSTEM}
create_smartdesign -sd_name ${sd_name}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

# Create top level Ports
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {REFCLK_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_CLK} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DIR} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_NXT} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_STP} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA0} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA1} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA2} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA3} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA4} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA5} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA6} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_DATA7} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {USB_OCn} -port_direction {IN} 

sd_create_scalar_port -sd_name ${sd_name} -port_name {UART0_TXD} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART1_TXD} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {UART0_RXD} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART1_RXD} -port_direction {IN}

sd_create_scalar_port -sd_name ${sd_name} -port_name {MSS_DLL_LOCKS} -port_direction {OUT}

sd_create_scalar_port -sd_name ${sd_name} -port_name {RESET_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ODT} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CKE} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CS} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {CK_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_P} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_RX0_N} -port_direction {IN} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX0_P} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {SGMII_TX0_N} -port_direction {OUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SCL} -port_direction {INOUT} -port_is_pad {1}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C_1_SDA} -port_direction {INOUT} -port_is_pad {1}

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

sd_create_scalar_port -sd_name ${sd_name} -port_name {FIC_3_PCLK} -port_direction {IN}

sd_create_bus_port -sd_name ${sd_name} -port_name {CA} -port_direction {OUT} -port_range {[5:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQ} -port_direction {INOUT} -port_range {[31:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DQS_N} -port_direction {INOUT} -port_range {[3:0]} -port_is_pad {1}
sd_create_bus_port -sd_name ${sd_name} -port_name {DM} -port_direction {OUT} -port_range {[3:0]} -port_is_pad {1}


#-------------------------------------------------------------------------------
# Analog to Digital Converter pins (for cape analog inputs)
#-------------------------------------------------------------------------------
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_CSn} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_SCK} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_MOSI} -port_direction {INOUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_MISO} -port_direction {INOUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_IRQn} -port_direction {IN}


#-------------------------------------------------------------------------------
# Cape pins
#-------------------------------------------------------------------------------
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_4_RXD} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {MMUART_4_TXD} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C0_SCL} -port_direction {INOUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {I2C0_SDA} -port_direction {INOUT}


#-------------------------------------------------------------------------------
# Ethernet PHY top level ports
#-------------------------------------------------------------------------------
#sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_RSTn} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_INTn} -port_direction {IN}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_MDC} -port_direction {OUT}
sd_create_scalar_port -sd_name ${sd_name} -port_name {PHY_MDIO} -port_direction {INOUT}



# Add FIC3_INITIATOR instance
sd_instantiate_component -sd_name ${sd_name} -component_name {FIC3_INITIATOR} -instance_name {FIC3_INITIATOR}



# Add APB_ARBITER instance
sd_instantiate_hdl_core -sd_name ${sd_name} -hdl_core_name {APB_ARBITER} -instance_name {} 



# Add I2C0_SCL_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {I2C0_SCL_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {I2C0_SCL_BIBUF:D} -value {GND}



# Add I2C0_SDA_BIBUF instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {BIBUF} -instance_name {I2C0_SDA_BIBUF}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {I2C0_SDA_BIBUF:D} -value {GND}



# Add IHC_SUBSYSTEM instance
sd_instantiate_component -sd_name ${sd_name} -component_name {IHC_SUBSYSTEM} -instance_name {IHC_SUBSYSTEM_0} 

# Add MSS instance
sd_instantiate_component -sd_name ${sd_name} -component_name {PF_SOC_MSS} -instance_name {PF_SOC_MSS}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_SOC_MSS:MSS_INT_F2M} -pin_slices {[0]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_SOC_MSS:MSS_INT_F2M} -pin_slices {[1]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_SOC_MSS:MSS_INT_F2M} -pin_slices {[2]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_SOC_MSS:MSS_INT_F2M} -pin_slices {[3]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_SOC_MSS:MSS_INT_F2M} -pin_slices {[4]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_SOC_MSS:MSS_INT_F2M} -pin_slices {[58:5]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_SOC_MSS:MSS_INT_F2M} -pin_slices {[59]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_SOC_MSS:MSS_INT_F2M} -pin_slices {[60]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_SOC_MSS:MSS_INT_F2M} -pin_slices {[61]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_SOC_MSS:MSS_INT_F2M} -pin_slices {[62]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {PF_SOC_MSS:MSS_INT_F2M} -pin_slices {[63]}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_SOC_MSS:MSS_INT_F2M[58:5]} -value {GND}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_SOC_MSS:MSS_INT_M2F}
#sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_SOC_MSS:FIC_2_AXI4_TARGET}


# Add AND_DLL_LOCKS instance
sd_instantiate_macro -sd_name ${sd_name} -macro_name {AND4} -instance_name {AND_DLL_LOCKS}


# Clocks and resets
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC_3_PCLK" "IHC_SUBSYSTEM_0:pclk" "PF_SOC_MSS:FIC_3_PCLK"}



# Add scalar net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK" "PF_SOC_MSS:CK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CK_N" "PF_SOC_MSS:CK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CKE" "PF_SOC_MSS:CKE" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"CS" "PF_SOC_MSS:CS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:I2C_0_SCL_F2M" "I2C0_SCL_BIBUF:Y" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:I2C_0_SDA_F2M" "I2C0_SDA_BIBUF:Y" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C0_SDA_BIBUF:PAD" "I2C0_SDA"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"I2C0_SCL_BIBUF:PAD" "I2C0_SCL"}



sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:I2C_1_SCL" "I2C_1_SCL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:I2C_1_SDA" "I2C_1_SDA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:MMUART_0_RXD" "UART0_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:MMUART_0_TXD" "UART0_TXD" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:MMUART_1_RXD_F2M" "MMUART1_RXD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:MMUART_1_TXD_M2F" "MMUART1_TXD" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_DLL_LOCKS:A" "PF_SOC_MSS:FIC_0_DLL_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_DLL_LOCKS:B" "PF_SOC_MSS:FIC_1_DLL_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_DLL_LOCKS:C" "PF_SOC_MSS:FIC_2_DLL_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_DLL_LOCKS:D" "PF_SOC_MSS:FIC_3_DLL_LOCK_M2F" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"AND_DLL_LOCKS:Y" "MSS_DLL_LOCKS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:I2C_0_SCL_OE_M2F" "I2C0_SCL_BIBUF:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:I2C_0_SDA_OE_M2F" "I2C0_SDA_BIBUF:E" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ODT" "PF_SOC_MSS:ODT" }

#-------------------------------------------------------------------------------
# Connect ADC.
#-------------------------------------------------------------------------------
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:QSPI_CLK" "ADC_SCK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:QSPI_SS0" "ADC_CSn" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:QSPI_DATA0" "ADC_MOSI" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:QSPI_DATA1" "ADC_MISO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_IRQn" "PF_SOC_MSS:GPIO_1_20_IN" }

#-------------------------------------------------------------------------------
sd_connect_pins -sd_name ${sd_name} -pin_names {"REFCLK" "PF_SOC_MSS:REFCLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"REFCLK_N" "PF_SOC_MSS:REFCLK_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"RESET_N" "PF_SOC_MSS:RESET_N" }

#-------------------------------------------------------------------------------
# Ethernet PHY connections
#-------------------------------------------------------------------------------
sd_connect_pins -sd_name ${sd_name} -pin_names {"PHY_MDIO" "PF_SOC_MSS:MAC_0_MDIO" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PHY_MDC" "PF_SOC_MSS:MAC_0_MDC" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PHY_INTn" "PF_SOC_MSS:MSS_INT_F2M[2:2]" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_RX0_N" "PF_SOC_MSS:SGMII_RX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_RX0_P" "PF_SOC_MSS:SGMII_RX0_P" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_TX0_N" "PF_SOC_MSS:SGMII_TX0_N" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SGMII_TX0_P" "PF_SOC_MSS:SGMII_TX0_P" }

#-------------------------------------------------------------------------------
# OTG USB
#-------------------------------------------------------------------------------
sd_connect_pins -sd_name ${sd_name} -pin_names {"USB_OCn" "PF_SOC_MSS:GPIO_1_23_IN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:USB_CLK" "USB_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:USB_DATA0" "USB_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:USB_DATA1" "USB_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:USB_DATA2" "USB_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:USB_DATA3" "USB_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:USB_DATA4" "USB_DATA4" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:USB_DATA5" "USB_DATA5" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:USB_DATA6" "USB_DATA6" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:USB_DATA7" "USB_DATA7" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:USB_DIR" "USB_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:USB_NXT" "USB_NXT" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:USB_STP" "USB_STP" }

#-------------------------------------------------------------------------------
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_CLK_EMMC_CLK" "PF_SOC_MSS:SD_CLK" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_CMD_EMMC_CMD" "PF_SOC_MSS:SD_CMD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_DATA0_EMMC_DATA0" "PF_SOC_MSS:SD_DATA0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_DATA1_EMMC_DATA1" "PF_SOC_MSS:SD_DATA1" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_DATA2_EMMC_DATA2" "PF_SOC_MSS:SD_DATA2" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_DATA3_EMMC_DATA3" "PF_SOC_MSS:SD_DATA3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_POW_EMMC_DATA4" "PF_SOC_MSS:SD_POW" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_VOLT_SEL_EMMC_DATA5" "PF_SOC_MSS:SD_VOLT_SEL" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_VOLT_EN_EMMC_DATA6" "PF_SOC_MSS:SD_VOLT_EN" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_VOLT_CMD_DIR_EMMC_DATA7" "PF_SOC_MSS:SD_VOLT_CMD_DIR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_VOLT_DIR_1_3_EMMC_UNUSED" "PF_SOC_MSS:SD_VOLT_DIR_1_3" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_VOLT_DIR_0_EMMC_UNUSED" "PF_SOC_MSS:SD_VOLT_DIR_0" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_CD_EMMC_STRB" "PF_SOC_MSS:SD_CD" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"SD_WP_EMMC_RSTN" "PF_SOC_MSS:SD_WP" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:MSS_INT_F2M[63]" "IHC_SUBSYSTEM_0:E51_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:MSS_INT_F2M[62]" "IHC_SUBSYSTEM_0:U54_1_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:MSS_INT_F2M[61]" "IHC_SUBSYSTEM_0:U54_2_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:MSS_INT_F2M[60]" "IHC_SUBSYSTEM_0:U54_3_IRQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:MSS_INT_F2M[59]" "IHC_SUBSYSTEM_0:U54_4_IRQ" }

# Add bus net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:CA" "CA" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DM" "PF_SOC_MSS:DM" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQ" "PF_SOC_MSS:DQ" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS" "PF_SOC_MSS:DQS" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"DQS_N" "PF_SOC_MSS:DQS_N" }

# Add bus interface net connections
sd_connect_pins -sd_name ${sd_name} -pin_names {"FIC3_INITIATOR:APB3mmaster" "APB_ARBITER_0:APB_MASTER_low" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"APB_ARBITER_0:APB_MMASTER" "PF_SOC_MSS:FIC_3_APB_INITIATOR" }
sd_connect_pins -sd_name ${sd_name} -pin_names {"IHC_SUBSYSTEM_0:APB3mmaster" "APB_ARBITER_0:APB_MASTER_high" }



#-------------------------------------------------------------------------------
# PCIe interrupt.
#-------------------------------------------------------------------------------
sd_create_scalar_port -sd_name ${sd_name} -port_name {PCIE_INT_N} -port_direction {IN}
sd_connect_pins -sd_name ${sd_name} -pin_names {"PCIE_INT_N" "PF_SOC_MSS:MSS_INT_F2M[1:1]" }


#-------------------------------------------------------------------------------
# Cape
#-------------------------------------------------------------------------------
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:MMUART_4_TXD_M2F" "MMUART_4_TXD"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"PF_SOC_MSS:MMUART_4_RXD_F2M" "MMUART_4_RXD"}


#-------------------------------------------------------------------------------
# Promote signals to module's top level
#-------------------------------------------------------------------------------
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:FIC_2_AXI4_TARGET} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:FIC_1_AXI4_TARGET} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:FIC_0_AXI4_TARGET} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {FIC3_INITIATOR:APBmslave0} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {FIC3_INITIATOR:APBmslave1} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {FIC3_INITIATOR:APBmslave2} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {FIC3_INITIATOR:APBmslave3} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {IHC_SUBSYSTEM_0:presetn} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:FIC_0_ACLK} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:FIC_1_ACLK} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:FIC_2_ACLK} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_6} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_12} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_15} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_1} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_16} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_2} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_0} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_5} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_9} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_3} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_10} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_4} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_7} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_8} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_13} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_14} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_17} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_11} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_F2M_18} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:MSS_RESET_N_M2F} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_0} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_18} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_17} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_16} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_15} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_14} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_13} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_12} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_11} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_10} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_9} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_8} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_7} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_6} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_5} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_4} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_3} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_2} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_1} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_M2F_0} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_18} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_17} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_16} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_15} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_14} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_13} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_12} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_11} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_10} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_9} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_8} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_7} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_6} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_5} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_4} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_3} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_2} -port_name {} 
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_2_OE_M2F_1} -port_name {} 

sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:FIC_0_AXI4_INITIATOR} -port_name {} 

sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_SOC_MSS:MMUART_1_TXD_OE_M2F} 

sd_rename_port -sd_name ${sd_name} -current_port_name {APBmslave0} -new_port_name {CAPE_APB_MTARGET} 
sd_rename_port -sd_name ${sd_name} -current_port_name {APBmslave1} -new_port_name {M2_APB_MTARGET} 
sd_rename_port -sd_name ${sd_name} -current_port_name {APBmslave2} -new_port_name {HSI_APB_MTARGET} 
sd_rename_port -sd_name ${sd_name} -current_port_name {APBmslave3} -new_port_name {CSI_APB_MTARGET} 


#-------------------------------------------------------------------------------
# Temporary connections to allow running through complete flow.
#-------------------------------------------------------------------------------
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_SOC_MSS:MSS_INT_F2M[4:4]} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_SOC_MSS:MSS_INT_F2M[3:3]} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_SOC_MSS:MSS_INT_F2M[0:0]} -value {GND} 
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_SOC_MSS:MSS_RESET_N_F2M} -value {VCC}
#-------------------------------------------------------------------------------


# Mark pins unused
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_SOC_MSS:FIC_3_APB_M_PSTRB}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_SOC_MSS:PLL_CPU_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_SOC_MSS:PLL_DDR_LOCK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_SOC_MSS:PLL_SGMII_LOCK_M2F}

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1
# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
# Generate SmartDesign BVF_RISCV_SUBSYSTEM
generate_component -component_name ${sd_name}

