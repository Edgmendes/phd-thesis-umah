connect -url tcp:127.0.0.1:3121
source C:/Xilinx/workspace_18_2/TE0745v18-Haptic_INL_Test/TE0745v18-Haptic-master/Haptic_prj_18bits/Haptic_prj.sdk/te0745_haptic_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "JTAG-ONB4 25163300132CA"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "JTAG-ONB4 25163300132CA" && level==0} -index 1
fpga -file C:/Xilinx/workspace_18_2/TE0745v18-Haptic_INL_Test/TE0745v18-Haptic-master/Haptic_prj_18bits/Haptic_prj.sdk/te0745_haptic_wrapper_hw_platform_0/te0745_haptic_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "JTAG-ONB4 25163300132CA"} -index 0
loadhw -hw C:/Xilinx/workspace_18_2/TE0745v18-Haptic_INL_Test/TE0745v18-Haptic-master/Haptic_prj_18bits/Haptic_prj.sdk/te0745_haptic_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "JTAG-ONB4 25163300132CA"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "JTAG-ONB4 25163300132CA"} -index 0
dow C:/Xilinx/workspace_18_2/TE0745v18-Haptic_INL_Test/TE0745v18-Haptic-master/Haptic_prj_18bits/Haptic_prj.sdk/Test/Debug/Test.elf
configparams force-mem-access 0
bpadd -addr &main
