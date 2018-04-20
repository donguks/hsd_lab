#!/bin/bash -f
xv_path="/opt/Xilinx/Vivado/2016.4"
ExecStep()
{
"$@"
RETVAL=$?
if [ $RETVAL -ne 0 ]
then
exit $RETVAL
fi
}
ExecStep $xv_path/bin/xsim tb_floating_MAC_behav -key {Behavioral:sim_1:Functional:tb_floating_MAC} -tclbatch tb_floating_MAC.tcl -view /csehome/sdu6342/lab2_0316/tb_adder_array_behav.wcfg -log simulate.log
