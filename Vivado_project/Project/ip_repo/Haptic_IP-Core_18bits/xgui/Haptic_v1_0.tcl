# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "FCLK" -parent ${Page_0}
  ipgui::add_param $IPINST -name "NSONARS" -parent ${Page_0}
  ipgui::add_param $IPINST -name "debug" -parent ${Page_0}


}

proc update_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to update DATA_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.DATA_WIDTH { PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to validate DATA_WIDTH
	return true
}

proc update_PARAM_VALUE.FCLK { PARAM_VALUE.FCLK } {
	# Procedure called to update FCLK when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FCLK { PARAM_VALUE.FCLK } {
	# Procedure called to validate FCLK
	return true
}

proc update_PARAM_VALUE.FREQ_WIDTH { PARAM_VALUE.FREQ_WIDTH } {
	# Procedure called to update FREQ_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.FREQ_WIDTH { PARAM_VALUE.FREQ_WIDTH } {
	# Procedure called to validate FREQ_WIDTH
	return true
}

proc update_PARAM_VALUE.NSONARS { PARAM_VALUE.NSONARS } {
	# Procedure called to update NSONARS when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.NSONARS { PARAM_VALUE.NSONARS } {
	# Procedure called to validate NSONARS
	return true
}

proc update_PARAM_VALUE.PHASE_WIDTH { PARAM_VALUE.PHASE_WIDTH } {
	# Procedure called to update PHASE_WIDTH when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.PHASE_WIDTH { PARAM_VALUE.PHASE_WIDTH } {
	# Procedure called to validate PHASE_WIDTH
	return true
}

proc update_PARAM_VALUE.debug { PARAM_VALUE.debug } {
	# Procedure called to update debug when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.debug { PARAM_VALUE.debug } {
	# Procedure called to validate debug
	return true
}


proc update_MODELPARAM_VALUE.NSONARS { MODELPARAM_VALUE.NSONARS PARAM_VALUE.NSONARS } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.NSONARS}] ${MODELPARAM_VALUE.NSONARS}
}

proc update_MODELPARAM_VALUE.PHASE_WIDTH { MODELPARAM_VALUE.PHASE_WIDTH PARAM_VALUE.PHASE_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.PHASE_WIDTH}] ${MODELPARAM_VALUE.PHASE_WIDTH}
}

proc update_MODELPARAM_VALUE.DATA_WIDTH { MODELPARAM_VALUE.DATA_WIDTH PARAM_VALUE.DATA_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.DATA_WIDTH}] ${MODELPARAM_VALUE.DATA_WIDTH}
}

proc update_MODELPARAM_VALUE.FCLK { MODELPARAM_VALUE.FCLK PARAM_VALUE.FCLK } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FCLK}] ${MODELPARAM_VALUE.FCLK}
}

proc update_MODELPARAM_VALUE.debug { MODELPARAM_VALUE.debug PARAM_VALUE.debug } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.debug}] ${MODELPARAM_VALUE.debug}
}

proc update_MODELPARAM_VALUE.FREQ_WIDTH { MODELPARAM_VALUE.FREQ_WIDTH PARAM_VALUE.FREQ_WIDTH } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.FREQ_WIDTH}] ${MODELPARAM_VALUE.FREQ_WIDTH}
}

