// ******************************************************************************************
// File         : sequence_item.sv
// Author       : RyanHunter
// Creating Date: Sat Sep 26 22:43:38 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef sequence_item__sv
`define sequence_item__sv

class req_item extends uvm_sequence_item; // {

	`uvm_object_utils_begin(req_item)
	`uvm_object_utils_end

	function new (string name = "req_item");
		super.new(name);
	endfunction


endclass // }

class rsp_item extends uvm_sequence_item; // {

	`uvm_object_utils_begin(rsp_item)
	`uvm_object_utils_end

	function new (string name = "rsp_item");
		super.new(name);
	endfunction

endclass // }

`endif
