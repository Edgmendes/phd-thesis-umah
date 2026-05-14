connect -url tcp:127.0.0.1:3121
source C:/Anexos_PhD/Vivado_project/Project/TE0745v18-Haptic/Haptic_prj_18bits/Haptic_prj.sdk/te0745_haptic_wrapper_hw_platform_0/ps7_init.tcl
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "JTAG-ONB4 25163300128EA"} -index 0
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "JTAG-ONB4 25163300128EA" && level==0} -index 1
fpga -file C:/Anexos_PhD/Vivado_project/Project/TE0745v18-Haptic/Haptic_prj_18bits/Haptic_prj.sdk/te0745_haptic_wrapper_hw_platform_0/te0745_haptic_wrapper.bit
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "JTAG-ONB4 25163300128EA"} -index 0
loadhw -hw C:/Anexos_PhD/Vivado_project/Project/TE0745v18-Haptic/Haptic_prj_18bits/Haptic_prj.sdk/te0745_haptic_wrapper_hw_platform_0/system.hdf -mem-ranges [list {0x40000000 0xbfffffff}]
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*" && jtag_cable_name =~ "JTAG-ONB4 25163300128EA"} -index 0
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "JTAG-ONB4 25163300128EA"} -index 0
dow C:/Anexos_PhD/Vivado_project/Project/TE0745v18-Haptic/Haptic_prj_18bits/Haptic_prj.sdk/Test2/Debug/Test2.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "ARM*#0" && jtag_cable_name =~ "JTAG-ONB4 25163300128EA"} -index 0
con
