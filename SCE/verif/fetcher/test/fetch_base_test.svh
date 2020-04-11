// ******************************************************************************************
// File         : fetch_base_test.svh
// Author       : Ryan
// Creating Date: Fri Apr  3 08:45:42 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************

`ifndef fetch_base_test__svh
`define fetch_base_test__svh


class fetch_base_test extends uvm_test; // {


	top_env m_env;

	`uvm_component_utils(fetch_base_test)


	function new (string name = "fetch_base_test", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase);
		super.build_phase(phase);

		m_env = top_env::type_id::create("m_env",this);
	endfunction

	virtual task run(); // {
		fetch_bseq bseq = new("bseq");
		bseq.start();
	endtask // }

	task main_phase (uvm_phase phase); // {
		run();
	endtask // }


endclass // }

`endif
