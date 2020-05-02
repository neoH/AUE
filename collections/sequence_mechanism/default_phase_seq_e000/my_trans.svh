// ******************************************************************************************
// File         : my_trans.svh
// Author       : RyanHunter
// Creating Date: Sat May  2 07:40:51 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef my_trans__svh
`define my_trans__svh


class my_req extends uvm_sequence_item; // {

	bit [31:0] PA;
	bit is_write;
	bit [31:0] WD;

	`uvm_object_utils_begin(my_req)
		`uvm_field_int(PA,UVM_ALL_ON)
		`uvm_field_int(is_write,UVM_ALL_ON)
		`uvm_field_int(WD,UVM_ALL_ON)
	`uvm_object_utils_end

	function new (string name ="my_req"); // {
		super.new(name);
	endfunction // }

endclass // }

class my_rsp extends uvm_sequence_item; // {

	bit is_ok;
	bit [31:0] RD;

	`uvm_object_utils_begin(my_rsp)
		`uvm_field_int(is_ok,UVM_ALL_ON)
		`uvm_field_int(RD,UVM_ALL_ON)
	`uvm_object_utils_end

	function new (string name ="my_rsp"); // {
		super.new(name);
	endfunction // }

endclass // }




`endif
