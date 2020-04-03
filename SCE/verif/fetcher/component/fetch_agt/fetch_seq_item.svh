// ******************************************************************************************
// File         : fetch_seq_item.svh
// Author       : Ryan
// Creating Date: Fri Apr  3 08:23:35 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef fetch_seq_item__svh
`define fetch_seq_item__svh


class fetch_seq_item extends uvm_sequence_item; // {

	rand int unsigned delay; // ACK delay
	rand bit [31:0] dat;

	`uvm_object_utils_begin(fetch_seq_item)
		`uvm_field_int(delay,UVM_ALL_ON)
		`uvm_field_int(dat,UVM_ALL_ON)
	`uvm_object_utils_end


	function new (string name = "fetch_seq_item"); super.new(name); endfunction


endclass // }

`endif
