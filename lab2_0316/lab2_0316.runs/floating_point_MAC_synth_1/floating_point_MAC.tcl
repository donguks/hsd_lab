# 
# Synthesis run script generated by Vivado
# 

set_msg_config -msgmgr_mode ooc_run
create_project -in_memory -part xc7z020clg484-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir /csehome/sdu6342/lab2_0316/lab2_0316.cache/wt [current_project]
set_property parent.project_path /csehome/sdu6342/lab2_0316/lab2_0316.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part em.avnet.com:zed:part0:1.3 [current_project]
set_property ip_output_repo /csehome/sdu6342/lab2_0316/lab2_0316.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC.xci
set_property is_locked true [get_files /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC.xci]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}
read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir /csehome/sdu6342/lab2_0316/lab2_0316.runs/floating_point_MAC_synth_1 -new_name floating_point_MAC -ip [get_ips floating_point_MAC]]

if { $cached_ip eq {} } {

synth_design -top floating_point_MAC -part xc7z020clg484-1 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
catch {
 write_checkpoint -force -noxdef -rename_prefix floating_point_MAC_ floating_point_MAC.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ floating_point_MAC_stub.v
 lappend ipCachedFiles floating_point_MAC_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ floating_point_MAC_stub.vhdl
 lappend ipCachedFiles floating_point_MAC_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ floating_point_MAC_sim_netlist.v
 lappend ipCachedFiles floating_point_MAC_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ floating_point_MAC_sim_netlist.vhdl
 lappend ipCachedFiles floating_point_MAC_sim_netlist.vhdl

 config_ip_cache -add -dcp floating_point_MAC.dcp -move_files $ipCachedFiles -use_project_ipc -ip [get_ips floating_point_MAC]
}

rename_ref -prefix_all floating_point_MAC_

write_checkpoint -force -noxdef floating_point_MAC.dcp

catch { report_utilization -file floating_point_MAC_utilization_synth.rpt -pb floating_point_MAC_utilization_synth.pb }

if { [catch {
  file copy -force /csehome/sdu6342/lab2_0316/lab2_0316.runs/floating_point_MAC_synth_1/floating_point_MAC.dcp /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force /csehome/sdu6342/lab2_0316/lab2_0316.runs/floating_point_MAC_synth_1/floating_point_MAC.dcp /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force /csehome/sdu6342/lab2_0316/lab2_0316.runs/floating_point_MAC_synth_1/floating_point_MAC_stub.v /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force /csehome/sdu6342/lab2_0316/lab2_0316.runs/floating_point_MAC_synth_1/floating_point_MAC_stub.vhdl /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force /csehome/sdu6342/lab2_0316/lab2_0316.runs/floating_point_MAC_synth_1/floating_point_MAC_sim_netlist.v /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force /csehome/sdu6342/lab2_0316/lab2_0316.runs/floating_point_MAC_synth_1/floating_point_MAC_sim_netlist.vhdl /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir /csehome/sdu6342/lab2_0316/lab2_0316.ip_user_files/ip/floating_point_MAC]} {
  catch { 
    file copy -force /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC_stub.v /csehome/sdu6342/lab2_0316/lab2_0316.ip_user_files/ip/floating_point_MAC
  }
}

if {[file isdir /csehome/sdu6342/lab2_0316/lab2_0316.ip_user_files/ip/floating_point_MAC]} {
  catch { 
    file copy -force /csehome/sdu6342/lab2_0316/lab2_0316.srcs/sources_1/ip/floating_point_MAC/floating_point_MAC_stub.vhdl /csehome/sdu6342/lab2_0316/lab2_0316.ip_user_files/ip/floating_point_MAC
  }
}
