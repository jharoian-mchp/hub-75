# Exporting Component Description of PF_CCC_C0 to TCL
# Family: PolarFireSoC
# Part Number: MPFS025T-FCVG484E
# Create and Configure the core component PF_CCC_C0
create_and_configure_core -core_vlnv {Actel:SgCore:PF_CCC:2.2.220} -component_name {PF_CCC_C0} -params {\
"DLL_CLK_0_BANKCLK_EN:false"  \
"DLL_CLK_0_DEDICATED_EN:false"  \
"DLL_CLK_0_FABCLK_EN:false"  \
"DLL_CLK_1_BANKCLK_EN:false"  \
"DLL_CLK_1_DEDICATED_EN:false"  \
"DLL_CLK_1_FABCLK_EN:false"  \
"DLL_CLK_P_EN:false"  \
"DLL_CLK_P_OPTIONS_EN:false"  \
"DLL_CLK_REF_OPTION:DIVIDE_BY_1"  \
"DLL_CLK_REF_OPTIONS_EN:false"  \
"DLL_CLK_S_EN:false"  \
"DLL_CLK_S_OPTION:DIVIDE_BY_1"  \
"DLL_CLK_S_OPTIONS_EN:false"  \
"DLL_DELAY4:0"  \
"DLL_DYNAMIC_CODE_EN:false"  \
"DLL_DYNAMIC_RECONFIG_INTERFACE_EN:false"  \
"DLL_EXPORT_PWRDWN:false"  \
"DLL_FB_CLK:Primary"  \
"DLL_FB_EN:false"  \
"DLL_FINE_PHASE_CODE:0"  \
"DLL_IN:133"  \
"DLL_JITTER:0"  \
"DLL_MODE:PHASE_REF_MODE"  \
"DLL_ONLY_EN:false"  \
"DLL_OUT_0:1"  \
"DLL_OUT_1:1"  \
"DLL_PRIM_PHASE:90"  \
"DLL_PRIM_PHASE_CODE:0"  \
"DLL_SEC_PHASE:90"  \
"DLL_SEC_PHASE_CODE:0"  \
"DLL_SELECTED_IN:Output2"  \
"FF_REQUIRES_LOCK_EN_0:0"  \
"GL0_0_BANKCLK_USED:false"  \
"GL0_0_BYPASS:0"  \
"GL0_0_BYPASS_EN:false"  \
"GL0_0_DEDICATED_USED:false"  \
"GL0_0_DIV:46"  \
"GL0_0_DIVSTART:0"  \
"GL0_0_DYNAMIC_PH:false"  \
"GL0_0_EXPOSE_EN:false"  \
"GL0_0_FABCLK_GATED_USED:false"  \
"GL0_0_FABCLK_USED:true"  \
"GL0_0_FREQ_SEL:false"  \
"GL0_0_IS_USED:true"  \
"GL0_0_OUT_FREQ:25"  \
"GL0_0_PHASE_INDEX:0"  \
"GL0_0_PHASE_SEL:false"  \
"GL0_0_PLL_PHASE:0"  \
"GL0_1_BANKCLK_USED:false"  \
"GL0_1_BYPASS:0"  \
"GL0_1_BYPASS_EN:false"  \
"GL0_1_DEDICATED_USED:false"  \
"GL0_1_DIV:1"  \
"GL0_1_DIVSTART:0"  \
"GL0_1_DYNAMIC_PH:false"  \
"GL0_1_EXPOSE_EN:false"  \
"GL0_1_FABCLK_USED:false"  \
"GL0_1_FREQ_SEL:false"  \
"GL0_1_IS_USED:true"  \
"GL0_1_OUT_FREQ:100"  \
"GL0_1_PHASE_INDEX:0"  \
"GL0_1_PHASE_SEL:false"  \
"GL0_1_PLL_PHASE:0"  \
"GL1_0_BANKCLK_USED:false"  \
"GL1_0_BYPASS:0"  \
"GL1_0_BYPASS_EN:false"  \
"GL1_0_DEDICATED_USED:false"  \
"GL1_0_DIV:1"  \
"GL1_0_DIVSTART:0"  \
"GL1_0_DYNAMIC_PH:false"  \
"GL1_0_EXPOSE_EN:false"  \
"GL1_0_FABCLK_GATED_USED:false"  \
"GL1_0_FABCLK_USED:true"  \
"GL1_0_FREQ_SEL:false"  \
"GL1_0_IS_USED:false"  \
"GL1_0_OUT_FREQ:100"  \
"GL1_0_PHASE_INDEX:0"  \
"GL1_0_PHASE_SEL:false"  \
"GL1_0_PLL_PHASE:0"  \
"GL1_1_BANKCLK_USED:false"  \
"GL1_1_BYPASS:0"  \
"GL1_1_BYPASS_EN:false"  \
"GL1_1_DEDICATED_USED:false"  \
"GL1_1_DIV:1"  \
"GL1_1_DIVSTART:0"  \
"GL1_1_DYNAMIC_PH:false"  \
"GL1_1_EXPOSE_EN:false"  \
"GL1_1_FABCLK_USED:false"  \
"GL1_1_FREQ_SEL:false"  \
"GL1_1_IS_USED:false"  \
"GL1_1_OUT_FREQ:0"  \
"GL1_1_PHASE_INDEX:0"  \
"GL1_1_PHASE_SEL:false"  \
"GL1_1_PLL_PHASE:0"  \
"GL2_0_BANKCLK_USED:false"  \
"GL2_0_BYPASS:0"  \
"GL2_0_BYPASS_EN:false"  \
"GL2_0_DEDICATED_USED:false"  \
"GL2_0_DIV:1"  \
"GL2_0_DIVSTART:0"  \
"GL2_0_DYNAMIC_PH:false"  \
"GL2_0_EXPOSE_EN:false"  \
"GL2_0_FABCLK_GATED_USED:false"  \
"GL2_0_FABCLK_USED:true"  \
"GL2_0_FREQ_SEL:false"  \
"GL2_0_IS_USED:false"  \
"GL2_0_OUT_FREQ:100"  \
"GL2_0_PHASE_INDEX:0"  \
"GL2_0_PHASE_SEL:false"  \
"GL2_0_PLL_PHASE:0"  \
"GL2_1_BANKCLK_USED:false"  \
"GL2_1_BYPASS:0"  \
"GL2_1_BYPASS_EN:false"  \
"GL2_1_DEDICATED_USED:false"  \
"GL2_1_DIV:1"  \
"GL2_1_DIVSTART:0"  \
"GL2_1_DYNAMIC_PH:false"  \
"GL2_1_EXPOSE_EN:false"  \
"GL2_1_FABCLK_USED:false"  \
"GL2_1_FREQ_SEL:false"  \
"GL2_1_IS_USED:false"  \
"GL2_1_OUT_FREQ:0"  \
"GL2_1_PHASE_INDEX:0"  \
"GL2_1_PHASE_SEL:false"  \
"GL2_1_PLL_PHASE:0"  \
"GL3_0_BANKCLK_USED:false"  \
"GL3_0_BYPASS:0"  \
"GL3_0_BYPASS_EN:false"  \
"GL3_0_DEDICATED_USED:false"  \
"GL3_0_DIV:1"  \
"GL3_0_DIVSTART:0"  \
"GL3_0_DYNAMIC_PH:false"  \
"GL3_0_EXPOSE_EN:false"  \
"GL3_0_FABCLK_GATED_USED:false"  \
"GL3_0_FABCLK_USED:true"  \
"GL3_0_FREQ_SEL:false"  \
"GL3_0_IS_USED:false"  \
"GL3_0_OUT_FREQ:100"  \
"GL3_0_PHASE_INDEX:0"  \
"GL3_0_PHASE_SEL:false"  \
"GL3_0_PLL_PHASE:0"  \
"GL3_1_BANKCLK_USED:false"  \
"GL3_1_BYPASS:0"  \
"GL3_1_BYPASS_EN:false"  \
"GL3_1_DEDICATED_USED:false"  \
"GL3_1_DIV:1"  \
"GL3_1_DIVSTART:0"  \
"GL3_1_DYNAMIC_PH:false"  \
"GL3_1_EXPOSE_EN:false"  \
"GL3_1_FABCLK_USED:false"  \
"GL3_1_FREQ_SEL:false"  \
"GL3_1_IS_USED:false"  \
"GL3_1_OUT_FREQ:0"  \
"GL3_1_PHASE_INDEX:0"  \
"GL3_1_PHASE_SEL:false"  \
"GL3_1_PLL_PHASE:0"  \
"PLL_ALLOW_CCC_EXT_FB:false"  \
"PLL_BANDWIDTH_0:2"  \
"PLL_BANDWIDTH_1:1"  \
"PLL_BYPASS_GO_B_0:false"  \
"PLL_BYPASS_GO_B_1:false"  \
"PLL_BYPASS_POST_0:0"  \
"PLL_BYPASS_POST_0_0:false"  \
"PLL_BYPASS_POST_0_1:false"  \
"PLL_BYPASS_POST_0_2:false"  \
"PLL_BYPASS_POST_0_3:false"  \
"PLL_BYPASS_POST_1:0"  \
"PLL_BYPASS_POST_1_0:false"  \
"PLL_BYPASS_POST_1_1:false"  \
"PLL_BYPASS_POST_1_2:false"  \
"PLL_BYPASS_POST_1_3:false"  \
"PLL_BYPASS_PRE_0:0"  \
"PLL_BYPASS_PRE_0_0:false"  \
"PLL_BYPASS_PRE_0_1:false"  \
"PLL_BYPASS_PRE_0_2:false"  \
"PLL_BYPASS_PRE_0_3:false"  \
"PLL_BYPASS_PRE_1:0"  \
"PLL_BYPASS_PRE_1_0:false"  \
"PLL_BYPASS_PRE_1_1:false"  \
"PLL_BYPASS_PRE_1_2:false"  \
"PLL_BYPASS_PRE_1_3:false"  \
"PLL_BYPASS_SEL_0:0"  \
"PLL_BYPASS_SEL_0_0:false"  \
"PLL_BYPASS_SEL_0_1:false"  \
"PLL_BYPASS_SEL_0_2:false"  \
"PLL_BYPASS_SEL_0_3:false"  \
"PLL_BYPASS_SEL_1:0"  \
"PLL_BYPASS_SEL_1_0:false"  \
"PLL_BYPASS_SEL_1_1:false"  \
"PLL_BYPASS_SEL_1_2:false"  \
"PLL_BYPASS_SEL_1_3:false"  \
"PLL_DELAY_LINE_REF_FB_0:false"  \
"PLL_DELAY_LINE_REF_FB_1:false"  \
"PLL_DELAY_LINE_USED_0:false"  \
"PLL_DELAY_LINE_USED_1:false"  \
"PLL_DELAY_STEPS_0:1"  \
"PLL_DELAY_STEPS_1:1"  \
"PLL_DLL_CASCADED_EN:false"  \
"PLL_DYNAMIC_CONTROL_EN_0:true"  \
"PLL_DYNAMIC_CONTROL_EN_1:false"  \
"PLL_DYNAMIC_RECONFIG_INTERFACE_EN_0:false"  \
"PLL_DYNAMIC_RECONFIG_INTERFACE_EN_1:false"  \
"PLL_EXPORT_PWRDWN:true"  \
"PLL_EXT_MAX_ADDR_0:128"  \
"PLL_EXT_MAX_ADDR_1:128"  \
"PLL_EXT_WAVE_SEL_0:0"  \
"PLL_EXT_WAVE_SEL_1:0"  \
"PLL_FB_CLK_0:GL0_0"  \
"PLL_FB_CLK_1:GL0_1"  \
"PLL_FEEDBACK_MODE_0:Post-VCO"  \
"PLL_FEEDBACK_MODE_1:Post-VCO"  \
"PLL_IN_FREQ_0:50"  \
"PLL_IN_FREQ_1:100"  \
"PLL_INT_MODE_EN_0:false"  \
"PLL_INT_MODE_EN_1:false"  \
"PLL_LOCK_COUNT_0:8"  \
"PLL_LOCK_COUNT_1:8"  \
"PLL_LP_REQUIRES_LOCK_EN_0:false"  \
"PLL_LP_REQUIRES_LOCK_EN_1:false"  \
"PLL_PLL_CASCADED_EN:false"  \
"PLL_PLL_CASCADED_SELECTED_CLK:Output2"  \
"PLL_POSTDIVIDERADDSOFTLOGIC_0:true"  \
"PLL_REF_CLK_SEL_0:false"  \
"PLL_REF_CLK_SEL_1:false"  \
"PLL_REFDIV_0:25"  \
"PLL_REFDIV_1:1"  \
"PLL_RESET_ON_LOCK_0:true"  \
"PLL_SPREAD_MODE_0:false"  \
"PLL_SPREAD_MODE_1:false"  \
"PLL_SSM_DEPTH_0:5"  \
"PLL_SSM_DEPTH_1:5"  \
"PLL_SSM_DIVVAL_0:1"  \
"PLL_SSM_DIVVAL_1:1"  \
"PLL_SSM_FREQ_0:32"  \
"PLL_SSM_FREQ_1:32"  \
"PLL_SSM_RAND_PATTERN_0:2"  \
"PLL_SSM_RAND_PATTERN_1:2"  \
"PLL_SSMD_EN_0:false"  \
"PLL_SSMD_EN_1:false"  \
"PLL_SYNC_CORNER_PLL:false"  \
"PLL_SYNC_EN:false"  \
"PLL_VCO_MODE_0:MIN_JITTER"  \
"PLL_VCO_MODE_1:MIN_JITTER"   }
# Exporting Component Description of PF_CCC_C0 to TCL done
