if {[file isdirectory $local_dir/script_support/components/MSS]} {
    file delete -force $local_dir/script_support/components/MSS
}
file mkdir $local_dir/script_support/components/MSS
exec $mss_config_loc -GENERATE -CONFIGURATION_FILE:$local_dir/script_support/MSS_Configuration.cfg -OUTPUT_DIR:$local_dir/script_support/components/MSS
import_mss_component -file "$local_dir/script_support/components/MSS/PF_SOC_MSS.cxz"
source script_support/hdl_source.tcl
source script_support/components/CLOCKS_AND_RESETS/CORERESET_0.tcl
source script_support/components/CLOCKS_AND_RESETS/INIT_MONITOR.tcl 
source script_support/components/CLOCKS_AND_RESETS/FPGA_CCC_C0.tcl
source script_support/components/FIC0_INITIATOR.tcl 
source script_support/components/CLOCKS_AND_RESETS/CLK_DIV.tcl 
source script_support/components/CLOCKS_AND_RESETS/GLITCHLESS_MUX.tcl 
source script_support/components/CLOCKS_AND_RESETS/TRANSMIT_PLL.tcl 
source script_support/components/CLOCKS_AND_RESETS/PCIE_REF_CLK.tcl 
source script_support/components/FIC3_INITIATOR.tcl
source script_support/components/CLOCKS_AND_RESETS/OSCILLATOR_160MHz.tcl
source script_support/components/CLOCKS_AND_RESETS/ADC_MCLK_CCC.tcl 
source script_support/components/CLOCKS_AND_RESETS/CLOCKS_AND_RESETS.tcl 
source script_support/components/IHC_APB.tcl
source script_support/components/IHC_SUBSYSTEM.tcl
source script_support/components/BVF_RISCV_SUBSYSTEM.tcl
source script_support/components/B_V_F_BASE_DESIGN.tcl 
set_root -module {B_V_F_BASE_DESIGN::work} 
