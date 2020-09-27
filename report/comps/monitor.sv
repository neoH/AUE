// ******************************************************************************************
// File         : monitor.sv
// Author       : RyanHunter
// Creating Date: Sat Sep 26 10:18:09 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef monitor__sv
`define monitor__sv

class monitor extends uvm_monitor; // {

	`uvm_component_utils(monitor)


	function new (string name = "monitor", uvm_component parent = null);
		super.new(name,parent);
	endfunction

endclass // }

`endif
