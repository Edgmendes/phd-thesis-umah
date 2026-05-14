# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0" -display_name {AXI  Interface}]
  set_property tooltip {AXI  Interface Parameters} ${Page_0}
  ipgui::add_param $IPINST -name "N" -parent ${Page_0}
  set C_S00_AXI_DATA_WIDTH [ipgui::add_param $IPINST -name "C_S00_AXI_DATA_WIDTH" -parent ${Page_0} -widget comboBox]
  set_property tooltip {Width of S_AXI data bus} ${C_S00_AXI_DATA_WIDTH}
  set C_S00_AXI_ADDR_WIDTH [ipgui::add_param $IPINST -name "C_S00_AXI_ADDR_WIDTH" -parent ${Page_0}]
  set_property tooltip {Width of S_AXI address bus} ${C_S00_AXI_ADDR_WIDTH}

  #Adding Page
  set AXI_Registers [ipgui::add_page $IPINST -name "AXI Registers"]
  set_property tooltip {Configure AXI Registers Default Value} ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG0" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG1" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG2" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG3" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG4" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG5" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG6" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG7" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG8" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG9" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG10" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG11" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG12" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG13" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG14" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG15" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG16" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG17" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG18" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG19" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG20" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG21" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG22" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG23" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG24" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG25" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG26" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG27" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG28" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG29" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG30" -parent ${AXI_Registers}
  ipgui::add_param $IPINST -name "REG31" -parent ${AXI_Registers}


}

proc update_PARAM_VALUE.N { PARAM_VALUE.N } {
	# Procedure called to update N when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.N { PARAM_VALUE.N } {
	# Procedure called to validate N
	return true
}

proc update_PARAM_VALUE.REG0 { PARAM_VALUE.REG0 } {
	# Procedure called to update REG0 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG0 { PARAM_VALUE.REG0 } {
	# Procedure called to validate REG0
	return true
}

proc update_PARAM_VALUE.REG1 { PARAM_VALUE.REG1 } {
	# Procedure called to update REG1 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG1 { PARAM_VALUE.REG1 } {
	# Procedure called to validate REG1
	return true
}

proc update_PARAM_VALUE.REG10 { PARAM_VALUE.REG10 } {
	# Procedure called to update REG10 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG10 { PARAM_VALUE.REG10 } {
	# Procedure called to validate REG10
	return true
}

proc update_PARAM_VALUE.REG11 { PARAM_VALUE.REG11 } {
	# Procedure called to update REG11 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG11 { PARAM_VALUE.REG11 } {
	# Procedure called to validate REG11
	return true
}

proc update_PARAM_VALUE.REG12 { PARAM_VALUE.REG12 } {
	# Procedure called to update REG12 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG12 { PARAM_VALUE.REG12 } {
	# Procedure called to validate REG12
	return true
}

proc update_PARAM_VALUE.REG13 { PARAM_VALUE.REG13 } {
	# Procedure called to update REG13 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG13 { PARAM_VALUE.REG13 } {
	# Procedure called to validate REG13
	return true
}

proc update_PARAM_VALUE.REG14 { PARAM_VALUE.REG14 } {
	# Procedure called to update REG14 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG14 { PARAM_VALUE.REG14 } {
	# Procedure called to validate REG14
	return true
}

proc update_PARAM_VALUE.REG15 { PARAM_VALUE.REG15 } {
	# Procedure called to update REG15 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG15 { PARAM_VALUE.REG15 } {
	# Procedure called to validate REG15
	return true
}

proc update_PARAM_VALUE.REG16 { PARAM_VALUE.REG16 } {
	# Procedure called to update REG16 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG16 { PARAM_VALUE.REG16 } {
	# Procedure called to validate REG16
	return true
}

proc update_PARAM_VALUE.REG17 { PARAM_VALUE.REG17 } {
	# Procedure called to update REG17 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG17 { PARAM_VALUE.REG17 } {
	# Procedure called to validate REG17
	return true
}

proc update_PARAM_VALUE.REG18 { PARAM_VALUE.REG18 } {
	# Procedure called to update REG18 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG18 { PARAM_VALUE.REG18 } {
	# Procedure called to validate REG18
	return true
}

proc update_PARAM_VALUE.REG19 { PARAM_VALUE.REG19 } {
	# Procedure called to update REG19 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG19 { PARAM_VALUE.REG19 } {
	# Procedure called to validate REG19
	return true
}

proc update_PARAM_VALUE.REG2 { PARAM_VALUE.REG2 } {
	# Procedure called to update REG2 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG2 { PARAM_VALUE.REG2 } {
	# Procedure called to validate REG2
	return true
}

proc update_PARAM_VALUE.REG20 { PARAM_VALUE.REG20 } {
	# Procedure called to update REG20 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG20 { PARAM_VALUE.REG20 } {
	# Procedure called to validate REG20
	return true
}

proc update_PARAM_VALUE.REG21 { PARAM_VALUE.REG21 } {
	# Procedure called to update REG21 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG21 { PARAM_VALUE.REG21 } {
	# Procedure called to validate REG21
	return true
}

proc update_PARAM_VALUE.REG22 { PARAM_VALUE.REG22 } {
	# Procedure called to update REG22 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG22 { PARAM_VALUE.REG22 } {
	# Procedure called to validate REG22
	return true
}

proc update_PARAM_VALUE.REG23 { PARAM_VALUE.REG23 } {
	# Procedure called to update REG23 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG23 { PARAM_VALUE.REG23 } {
	# Procedure called to validate REG23
	return true
}

proc update_PARAM_VALUE.REG24 { PARAM_VALUE.REG24 } {
	# Procedure called to update REG24 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG24 { PARAM_VALUE.REG24 } {
	# Procedure called to validate REG24
	return true
}

proc update_PARAM_VALUE.REG25 { PARAM_VALUE.REG25 } {
	# Procedure called to update REG25 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG25 { PARAM_VALUE.REG25 } {
	# Procedure called to validate REG25
	return true
}

proc update_PARAM_VALUE.REG26 { PARAM_VALUE.REG26 } {
	# Procedure called to update REG26 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG26 { PARAM_VALUE.REG26 } {
	# Procedure called to validate REG26
	return true
}

proc update_PARAM_VALUE.REG27 { PARAM_VALUE.REG27 } {
	# Procedure called to update REG27 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG27 { PARAM_VALUE.REG27 } {
	# Procedure called to validate REG27
	return true
}

proc update_PARAM_VALUE.REG28 { PARAM_VALUE.REG28 } {
	# Procedure called to update REG28 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG28 { PARAM_VALUE.REG28 } {
	# Procedure called to validate REG28
	return true
}

proc update_PARAM_VALUE.REG29 { PARAM_VALUE.REG29 } {
	# Procedure called to update REG29 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG29 { PARAM_VALUE.REG29 } {
	# Procedure called to validate REG29
	return true
}

proc update_PARAM_VALUE.REG3 { PARAM_VALUE.REG3 } {
	# Procedure called to update REG3 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG3 { PARAM_VALUE.REG3 } {
	# Procedure called to validate REG3
	return true
}

proc update_PARAM_VALUE.REG30 { PARAM_VALUE.REG30 } {
	# Procedure called to update REG30 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG30 { PARAM_VALUE.REG30 } {
	# Procedure called to validate REG30
	return true
}

proc update_PARAM_VALUE.REG31 { PARAM_VALUE.REG31 } {
	# Procedure called to update REG31 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG31 { PARAM_VALUE.REG31 } {
	# Procedure called to validate REG31
	return true
}

proc update_PARAM_VALUE.REG4 { PARAM_VALUE.REG4 } {
	# Procedure called to update REG4 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG4 { PARAM_VALUE.REG4 } {
	# Procedure called to validate REG4
	return true
}

proc update_PARAM_VALUE.REG5 { PARAM_VALUE.REG5 } {
	# Procedure called to update REG5 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG5 { PARAM_VALUE.REG5 } {
	# Procedure called to validate REG5
	return true
}

proc update_PARAM_VALUE.REG6 { PARAM_VALUE.REG6 } {
	# Procedure called to update REG6 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG6 { PARAM_VALUE.REG6 } {
	# Procedure called to validate REG6
	return true
}

proc update_PARAM_VALUE.REG7 { PARAM_VALUE.REG7 } {
	# Procedure called to update REG7 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG7 { PARAM_VALUE.REG7 } {
	# Procedure called to validate REG7
	return true
}

proc update_PARAM_VALUE.REG8 { PARAM_VALUE.REG8 } {
	# Procedure called to update REG8 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG8 { PARAM_VALUE.REG8 } {
	# Procedure called to validate REG8
	return true
}

proc update_PARAM_VALUE.REG9 { PARAM_VALUE.REG9 } {
	# Procedure called to update REG9 when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.REG9 { PARAM_VALUE.REG9 } {
	# Procedure called to validate REG9
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to update C_S00_AXI_DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_DATA_WIDTH { PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to validate C_S00_AXI_DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to update C_S00_AXI_ADDR_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_ADDR_WIDTH { PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to validate C_S00_AXI_ADDR_WIDTH
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to update C_S00_AXI_BASEADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_BASEADDR { PARAM_VALUE.C_S00_AXI_BASEADDR } {
	# Procedure called to validate C_S00_AXI_BASEADDR
	return true
}

proc update_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to update C_S00_AXI_HIGHADDR when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.C_S00_AXI_HIGHADDR { PARAM_VALUE.C_S00_AXI_HIGHADDR } {
	# Procedure called to validate C_S00_AXI_HIGHADDR
	return true
}


proc update_MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH { MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH PARAM_VALUE.C_S00_AXI_DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_DATA_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH { MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH PARAM_VALUE.C_S00_AXI_ADDR_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.C_S00_AXI_ADDR_WIDTH}] ${MODELPARAM_VALUE.C_S00_AXI_ADDR_WIDTH}
}

proc update_MODELPARAM_VALUE.REG0 { MODELPARAM_VALUE.REG0 PARAM_VALUE.REG0 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG0}] ${MODELPARAM_VALUE.REG0}
}

proc update_MODELPARAM_VALUE.REG1 { MODELPARAM_VALUE.REG1 PARAM_VALUE.REG1 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG1}] ${MODELPARAM_VALUE.REG1}
}

proc update_MODELPARAM_VALUE.REG2 { MODELPARAM_VALUE.REG2 PARAM_VALUE.REG2 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG2}] ${MODELPARAM_VALUE.REG2}
}

proc update_MODELPARAM_VALUE.REG3 { MODELPARAM_VALUE.REG3 PARAM_VALUE.REG3 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG3}] ${MODELPARAM_VALUE.REG3}
}

proc update_MODELPARAM_VALUE.REG4 { MODELPARAM_VALUE.REG4 PARAM_VALUE.REG4 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG4}] ${MODELPARAM_VALUE.REG4}
}

proc update_MODELPARAM_VALUE.REG5 { MODELPARAM_VALUE.REG5 PARAM_VALUE.REG5 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG5}] ${MODELPARAM_VALUE.REG5}
}

proc update_MODELPARAM_VALUE.REG6 { MODELPARAM_VALUE.REG6 PARAM_VALUE.REG6 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG6}] ${MODELPARAM_VALUE.REG6}
}

proc update_MODELPARAM_VALUE.REG7 { MODELPARAM_VALUE.REG7 PARAM_VALUE.REG7 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG7}] ${MODELPARAM_VALUE.REG7}
}

proc update_MODELPARAM_VALUE.REG8 { MODELPARAM_VALUE.REG8 PARAM_VALUE.REG8 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG8}] ${MODELPARAM_VALUE.REG8}
}

proc update_MODELPARAM_VALUE.REG9 { MODELPARAM_VALUE.REG9 PARAM_VALUE.REG9 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG9}] ${MODELPARAM_VALUE.REG9}
}

proc update_MODELPARAM_VALUE.REG10 { MODELPARAM_VALUE.REG10 PARAM_VALUE.REG10 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG10}] ${MODELPARAM_VALUE.REG10}
}

proc update_MODELPARAM_VALUE.REG11 { MODELPARAM_VALUE.REG11 PARAM_VALUE.REG11 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG11}] ${MODELPARAM_VALUE.REG11}
}

proc update_MODELPARAM_VALUE.REG12 { MODELPARAM_VALUE.REG12 PARAM_VALUE.REG12 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG12}] ${MODELPARAM_VALUE.REG12}
}

proc update_MODELPARAM_VALUE.REG13 { MODELPARAM_VALUE.REG13 PARAM_VALUE.REG13 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG13}] ${MODELPARAM_VALUE.REG13}
}

proc update_MODELPARAM_VALUE.REG14 { MODELPARAM_VALUE.REG14 PARAM_VALUE.REG14 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG14}] ${MODELPARAM_VALUE.REG14}
}

proc update_MODELPARAM_VALUE.REG15 { MODELPARAM_VALUE.REG15 PARAM_VALUE.REG15 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG15}] ${MODELPARAM_VALUE.REG15}
}

proc update_MODELPARAM_VALUE.REG16 { MODELPARAM_VALUE.REG16 PARAM_VALUE.REG16 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG16}] ${MODELPARAM_VALUE.REG16}
}

proc update_MODELPARAM_VALUE.REG17 { MODELPARAM_VALUE.REG17 PARAM_VALUE.REG17 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG17}] ${MODELPARAM_VALUE.REG17}
}

proc update_MODELPARAM_VALUE.REG18 { MODELPARAM_VALUE.REG18 PARAM_VALUE.REG18 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG18}] ${MODELPARAM_VALUE.REG18}
}

proc update_MODELPARAM_VALUE.REG19 { MODELPARAM_VALUE.REG19 PARAM_VALUE.REG19 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG19}] ${MODELPARAM_VALUE.REG19}
}

proc update_MODELPARAM_VALUE.REG20 { MODELPARAM_VALUE.REG20 PARAM_VALUE.REG20 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG20}] ${MODELPARAM_VALUE.REG20}
}

proc update_MODELPARAM_VALUE.REG21 { MODELPARAM_VALUE.REG21 PARAM_VALUE.REG21 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG21}] ${MODELPARAM_VALUE.REG21}
}

proc update_MODELPARAM_VALUE.REG22 { MODELPARAM_VALUE.REG22 PARAM_VALUE.REG22 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG22}] ${MODELPARAM_VALUE.REG22}
}

proc update_MODELPARAM_VALUE.REG23 { MODELPARAM_VALUE.REG23 PARAM_VALUE.REG23 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG23}] ${MODELPARAM_VALUE.REG23}
}

proc update_MODELPARAM_VALUE.REG24 { MODELPARAM_VALUE.REG24 PARAM_VALUE.REG24 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG24}] ${MODELPARAM_VALUE.REG24}
}

proc update_MODELPARAM_VALUE.REG25 { MODELPARAM_VALUE.REG25 PARAM_VALUE.REG25 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG25}] ${MODELPARAM_VALUE.REG25}
}

proc update_MODELPARAM_VALUE.REG26 { MODELPARAM_VALUE.REG26 PARAM_VALUE.REG26 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG26}] ${MODELPARAM_VALUE.REG26}
}

proc update_MODELPARAM_VALUE.REG27 { MODELPARAM_VALUE.REG27 PARAM_VALUE.REG27 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG27}] ${MODELPARAM_VALUE.REG27}
}

proc update_MODELPARAM_VALUE.REG28 { MODELPARAM_VALUE.REG28 PARAM_VALUE.REG28 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG28}] ${MODELPARAM_VALUE.REG28}
}

proc update_MODELPARAM_VALUE.REG29 { MODELPARAM_VALUE.REG29 PARAM_VALUE.REG29 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG29}] ${MODELPARAM_VALUE.REG29}
}

proc update_MODELPARAM_VALUE.REG30 { MODELPARAM_VALUE.REG30 PARAM_VALUE.REG30 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG30}] ${MODELPARAM_VALUE.REG30}
}

proc update_MODELPARAM_VALUE.REG31 { MODELPARAM_VALUE.REG31 PARAM_VALUE.REG31 } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.REG31}] ${MODELPARAM_VALUE.REG31}
}

proc update_MODELPARAM_VALUE.N { MODELPARAM_VALUE.N PARAM_VALUE.N } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.N}] ${MODELPARAM_VALUE.N}
}

