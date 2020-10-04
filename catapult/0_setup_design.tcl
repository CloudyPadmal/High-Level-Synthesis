###################################################################
###################################################################
#
# Design data setup
#
###################################################################
###################################################################

set TARGET_TECHNOLOGY "SAED_EDK32_28nm"
set ALTERA_DEVICE_FAMILY "Cyclone 10 GX"
set ALTERA_DEVICE_TYPE  "10CX220YF780I5G"
set XILINX_FAMILY "Artix-7"
set XILINX_PART_NAME "xc7a200tffg1156-1"
set SHOW_REPORTS 0

# Top module name

set DESIGN_NAME "dualfir"

if [file exists input/${DESIGN_NAME}_proc.tcl ] {
    source "input/${DESIGN_NAME}_proc.tcl"
}

set SYSTEMC_SOURCE_FILES { \
			       "input/dualfir.cpp" \
			   }
set SYSTEMC_HEADER_FILES { \
			       "input/dualfir_defs.h" \
			   }
set SYSTEMC_TESTBENCH_FILES { \
				  "input/dualfir_tb.cpp" \
			      }

# Top module language (SystemVerilog, Verilog or VHDL)
set RTL_LANGUAGE "SystemVerilog"

# Specify design files (RTL modules)

set DESIGN_FILES { \
		       "input/dualfir_pkg.sv" \		       
		       "results/dualfir_hls_rtl.v" \
		       "input/dualfir.sv" \
		   }

# Specify Systemverilog testbench files
set TESTBENCH_FILES { "input/dualfir_test.sv" "input/dualfir_tb.sv" }


# SDC timing constraints file path
set SDC_FILE input/dualfir.sdc

# Clock and reset specification

set CLOCK_NAMES          { "clk" }
set CLOCK_PERIODS        { 3.0  }
set CLOCK_LATENCIES      { 0.0 }
set CLOCK_UNCERTAINTIES  { 0.0 }
set RESET_NAMES          { "rst_n" }
set RESET_LEVELS         {   0  }
set RESET_STYLES         { "async"  }
set INPUT_DELAYS         { 0.0 }
set OUTPUT_DELAYS        { 0.0 }
set OUTPUT_LOAD          0.01


###################################################################
# SystemC simulation
###################################################################

set CATAPULTHOME $env(CATAPULTHOME)
set CATAPULT_INCLUDE ${CATAPULTHOME}/shared/include/
set CC_OPTIONS "-I ${CATAPULTHOME}/shared/include/ -DCATAPULT_CXX -DDEBUG"
set GCC "${CATAPULTHOME}/bin/g++"
set GCOV "${CATAPULTHOME}/bin/gcov"

###################################################################
# HLS
###################################################################

set CATAPULT_LANGUAGE_FLAG "CATAPULT_CXX"
set CATAPULT_DIRECTIVE_FILE "input/catapult_directives.tcl"

set CATAPULT_ELABORATE_ONLY 0
set CATAPULT_RUN_SIMULATION 0
set CATAPULT_TRANSACTION_DONE_SIGNAL 0

###################################################################
# RTL simulation
###################################################################

set RTL_SIMULATION_TIME 300ns
set RTL_VS_SYSTEMC_SIMULATION 0
set RTL_POWER_ESTIMATION 0

###################################################################
# RTL formal verification
###################################################################


###################################################################
# RTL synthesis
###################################################################
set DC_COMPILE_COMMAND "compile"
#set DC_ALIB_PATH "/research/ellab/public/Logic_Libraries/NANGate_45nm/Synopsys/alib/alib-52"

set DC_SUPPRESS_MESSAGES { "UID-401" "TEST-130" }
#set GATED_CLOCKS { "clk" }
set INSERT_SCAN_CHAINS 0
# set SCAN_ENABLE_NAME "test_mode_sel"
# set SCAN_IN_NAMES { "" }
# set SCAN_OUT_NAMES { " " }

###################################################################
# Gate-level verification
###################################################################

set GATELEVEL_SIMULATION_TIME 1ms
set GATELEVEL_SDF TYP

###################################################################
# Standard-cell place and route
###################################################################


###################################################################
# Post-layout verification
###################################################################

set POSTLAYOUT_SIMULATION_TIME 1ms
set POSTLAYOUT_VS_RTL_SIMULATION 1
set POSTLAYOUT_SDF MAX
# set VSIM_DISABLE_TIMINGCHECKS { "*sff1*" }

###################################################################
# Post-layout power analysis
###################################################################

set VCD_SNAPSHOT_START_TIME 0ns
set VCD_SNAPSHOT_LENGTH 100us




