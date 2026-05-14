#Usage
#source "C:/Xilinx/workspace/ANC/AXI_Redirector/AXI_Interface_1.0/hdl/set_ports_properties.tcl"


# Example
#set_property driver_value 0 [ipx::get_ports slv_reg510 -of_objects [ipx::current_core]]
#set_property enablement_dependency {$N > 510} [ipx::get_ports slv_reg510 -of_objects [ipx::current_core]]
#append var \[set_property\ enablement_dependency\ \{$N > ] $i {} [ipx::get_ports slv_reg} $i { -of_objects [ipx::current_core]]}

#Set Properties
for {set i 0} {$i < 512} {set i [expr {$i + 1}]} {
	set var ""
	append var {set_property driver_value 0 [ipx::get_ports slv_reg} $i { -of_objects [ipx::current_core]]}
	eval "[set f $var]"
	set var ""
	append var {set_property enablement_dependency }  "\{\$N" {>} $i "\}" { [ipx::get_ports slv_reg} $i { -of_objects [ipx::current_core]]}
	eval "[set f $var]"
}	

