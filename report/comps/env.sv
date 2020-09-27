// ******************************************************************************************
// File         : env.sv
// Author       : RyanHunter
// Creating Date: Sat Sep 26 10:18:00 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef env__sv
`define env__sv


class env extends uvm_env; // {

	agent agt;

	`uvm_component_utils(env)


	function new (string name = "env", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase); // {
		super.build_phase (phase);

		agt = agent::type_id::create("agt",this);
	endfunction // }

endclass // }

`endif
