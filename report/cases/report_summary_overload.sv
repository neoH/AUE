// ******************************************************************************************
// File         : report_summary_overload.sv
// Author       : RyanHunter
// Creating Date: Sat Sep 26 11:03:55 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef report_summary_overload__sv
`define report_summary_overload__sv

class report_summary_overload extends test_base; // {

	`uvm_component_utils(report_summary_overload)

	function new (string name = "report_summary_overload", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	virtual function void build_phase (uvm_phase phase);
		super.build_phase(phase);
	endfunction

endclass // }

`endif
