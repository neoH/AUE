// ******************************************************************************************
// File         : my_main_seq.svh
// Author       : RyanHunter
// Creating Date: Sat May  2 23:31:02 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef my_main_seq__svh
`define my_main_seq__svh

class my_main_seq extends uvm_sequence; // {

	`uvm_object_utils(my_main_seq)

	function new (string name ="my_main_seq"); // {
		super.new(name);
	endfunction // }

	virtual task body(); // {
		`uvm_info("SEQ", "starting my_main_seq ... ...", UVM_LOW)
		`uvm_info("SEQ", "ending my_main_seq ... ...", UVM_LOW)
	endtask // }


endclass // }


`endif
