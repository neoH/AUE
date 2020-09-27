// ******************************************************************************************
// File         : test_base.sv
// Author       : RyanHunter
// Creating Date: Sat Sep 26 10:17:51 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef test_base__sv
`define test_base__sv

class test_base extends uvm_test; // {

	`uvm_component_utils(test_base)


	function new (string name = "test_base", uvm_component parent = null);
		super.new(name,parent);
	endfunction


	virtual task do_main_phase(); endtask

	task main_phase (uvm_phase phase); // {
		do_main_phase();
	endtask // }


endclass // }



`endif
