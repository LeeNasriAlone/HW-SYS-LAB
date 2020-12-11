# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
namespace eval ::optrace {
  variable script "D:/Vivado/Workspace/Lab05/Lab05.runs/synth_1/nano_sc_system.tcl"
  variable category "vivado_synth"
}

# Try to connect to running dispatch if we haven't done so already.
# This code assumes that the Tcl interpreter is not using threads,
# since the ::dispatch::connected variable isn't mutex protected.
if {![info exists ::dispatch::connected]} {
  namespace eval ::dispatch {
    variable connected false
    if {[llength [array get env XILINX_CD_CONNECT_ID]] > 0} {
      set result "true"
      if {[catch {
        if {[lsearch -exact [package names] DispatchTcl] < 0} {
          set result [load librdi_cd_clienttcl[info sharedlibextension]] 
        }
        if {$result eq "false"} {
          puts "WARNING: Could not load dispatch client library"
        }
        set connect_id [ ::dispatch::init_client -mode EXISTING_SERVER ]
        if { $connect_id eq "" } {
          puts "WARNING: Could not initialize dispatch client"
        } else {
          puts "INFO: Dispatch client connection id - $connect_id"
          set connected true
        }
      } catch_res]} {
        puts "WARNING: failed to connect to dispatch server - $catch_res"
      }
    }
  }
}
if {$::dispatch::connected} {
  # Remove the dummy proc if it exists.
  if { [expr {[llength [info procs ::OPTRACE]] > 0}] } {
    rename ::OPTRACE ""
  }
  proc ::OPTRACE { task action {tags {} } } {
    ::vitis_log::op_trace "$task" $action -tags $tags -script $::optrace::script -category $::optrace::category
  }
  # dispatch is generic. We specifically want to attach logging.
  ::vitis_log::connect_client
} else {
  # Add dummy proc if it doesn't exist.
  if { [expr {[llength [info procs ::OPTRACE]] == 0}] } {
    proc ::OPTRACE {{arg1 \"\" } {arg2 \"\"} {arg3 \"\" } {arg4 \"\"} {arg5 \"\" } {arg6 \"\"}} {
        # Do nothing
    }
  }
}

proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
OPTRACE "synth_1" START { ROLLUP_AUTO }
OPTRACE "Creating in-memory project" START { }
create_project -in_memory -part xc7a35tcpg236-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_property webtalk.parent_dir D:/Vivado/Workspace/Lab05/Lab05.cache/wt [current_project]
set_property parent.project_path D:/Vivado/Workspace/Lab05/Lab05.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language Verilog [current_project]
set_property board_part_repo_paths {C:/Users/PC/AppData/Roaming/Xilinx/Vivado/2020.1/xhub/board_store/xilinx_board_store} [current_project]
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
set_property ip_output_repo d:/Vivado/Workspace/Lab05/Lab05.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
OPTRACE "Creating in-memory project" END { }
OPTRACE "Adding files" START { }
read_mem {
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/new/prog.list
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/new/prog1.list
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/new/data.list
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/new/test_problem2.list
}
read_verilog -library xil_defaultlib {
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/Lab5Verilog/adder.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/Lab5Verilog/alu.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/new/clockDiv.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/Lab5Verilog/control.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/Lab5Verilog/extender.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/Lab5Verilog/memory.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/Lab5Verilog/mux2_1.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/Lab5Verilog/nanocpu.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/new/quadSevenSeg.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/Lab5Verilog/regfile.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/Lab5Verilog/rom.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/new/segmentDecoder.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/Lab5Verilog/nano_sc_system.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/new/mockIO.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/new/DFlipflop.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/new/inputStabilizer.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/Lab5Verilog/micropc.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/imports/new/singlePulser.v
  D:/Vivado/Workspace/Lab05/Lab05.srcs/sources_1/new/alu_test.v
}
OPTRACE "Adding files" END { }
# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc D:/Vivado/Workspace/Lab05/Lab05.srcs/constrs_1/new/constraint.xdc
set_property used_in_implementation false [get_files D:/Vivado/Workspace/Lab05/Lab05.srcs/constrs_1/new/constraint.xdc]

set_param ips.enableIPCacheLiteLoad 1
close [open __synthesis_is_running__ w]

OPTRACE "synth_design" START { }
synth_design -top nano_sc_system -part xc7a35tcpg236-1
OPTRACE "synth_design" END { }


OPTRACE "write_checkpoint" START { CHECKPOINT }
# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef nano_sc_system.dcp
OPTRACE "write_checkpoint" END { }
OPTRACE "synth reports" START { REPORT }
create_report "synth_1_synth_report_utilization_0" "report_utilization -file nano_sc_system_utilization_synth.rpt -pb nano_sc_system_utilization_synth.pb"
OPTRACE "synth reports" END { }
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
OPTRACE "synth_1" END { }