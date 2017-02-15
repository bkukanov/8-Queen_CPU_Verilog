###################################################################

# Created by write_sdc on Sun Feb 12 23:02:54 2017

###################################################################
set sdc_version 2.0

set_units -time ns -resistance MOhm -capacitance fF -voltage V -current mA
create_clock [get_ports clk]  -period 10  -waveform {0 5}
set_clock_uncertainty 0.02  [get_clocks clk]
set_input_delay -clock clk  0.1  [get_ports {in[3]}]
set_input_delay -clock clk  0.1  [get_ports {in[2]}]
set_input_delay -clock clk  0.1  [get_ports {in[1]}]
set_input_delay -clock clk  0.1  [get_ports {in[0]}]
set_input_delay -clock clk  0.1  [get_ports rst]
