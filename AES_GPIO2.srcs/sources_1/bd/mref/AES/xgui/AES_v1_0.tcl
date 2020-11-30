# Definitional proc to organize widgets for parameters.
proc init_gui { IPINST } {
  ipgui::add_param $IPINST -name "Component_Name"
  #Adding Page
  set Page_0 [ipgui::add_page $IPINST -name "Page 0"]
  ipgui::add_param $IPINST -name "key_size" -parent ${Page_0}
  ipgui::add_param $IPINST -name "round" -parent ${Page_0}


}

proc update_PARAM_VALUE.key_size { PARAM_VALUE.key_size } {
	# Procedure called to update key_size when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.key_size { PARAM_VALUE.key_size } {
	# Procedure called to validate key_size
	return true
}

proc update_PARAM_VALUE.round { PARAM_VALUE.round } {
	# Procedure called to update round when any of the dependent parameters in the arguments change
}

proc validate_PARAM_VALUE.round { PARAM_VALUE.round } {
	# Procedure called to validate round
	return true
}


proc update_MODELPARAM_VALUE.key_size { MODELPARAM_VALUE.key_size PARAM_VALUE.key_size } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.key_size}] ${MODELPARAM_VALUE.key_size}
}

proc update_MODELPARAM_VALUE.round { MODELPARAM_VALUE.round PARAM_VALUE.round } {
	# Procedure called to set VHDL generic/Verilog parameter value(s) based on TCL parameter value
	set_property value [get_property value ${PARAM_VALUE.round}] ${MODELPARAM_VALUE.round}
}

