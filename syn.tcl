#
# Your design
#
set base_name "top"
set rtl_file  "top.v alu.v decoder.v memory.v pc.v queen.v register.v selector.v zf.v"
set clock_name "clk"
set clock_period 10.0

#
# Libraries
#
set target_library "/proj/cad/freePDK45/lib/CCS/typical.db /proj/cad/freePDK45/lib/CCS/fast.db /proj/cad/freePDK45/lib/CCS/slow_css.db"
set synthetic_library "dw_foundation.sldb"
set link_library [concat "*" $target_library $synthetic_library]
set symbol_library "generic.sldb"
define_design_lib WORK -path ./WORK

#
# Read RTL file(s)
#
analyze -format verilog $rtl_file
elaborate $base_name
current_design $base_name
link
uniquify

#
# Timing
#
create_clock -name $clock_name -period $clock_period [find port $clock_name]
set_clock_uncertainty 0.02 [get_clocks $clock_name]
set_input_delay 0.1 -clock clk [remove_from_collection [all_inputs] {clk reset}]
set_output_delay 0.1 -clock clk [all_outputs]

#
# Clock gating
#
# set_clock_gating_style -sequential latch
# insert_clock_gating

#
# Design synthesis
#
compile -map_effort high
compile -incremental_mapping -map_effort high

#
# Output
#
write -format verilog -hierarchy -output ${base_name}.vnet
write_sdc ${base_name}.sdc

set REP_FILE "top.rep"

redirect $REP_FILE {report_timing}
report_reference -hier
redirect -append $REP_FILE {report_power}
quit
