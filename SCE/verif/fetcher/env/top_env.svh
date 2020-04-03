// ******************************************************************************************
// File         : top_env.svh
// Author       : Ryan
// Creating Date: Fri Apr  3 08:43:08 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************

`ifndef top_env__svh
`define top_env__svh


class top_env extends uvm_env; // {


	fetch_agt m_agt;

	`uvm_component_utils(top_env)


	function new (string name = "top_env", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase); // {
		super.build_phase(phase);

		m_agt = fetch_agt::type_id::create("m_agt",this);
	endfunction // }


endclass // }

`endif
