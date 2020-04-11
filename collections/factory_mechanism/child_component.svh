// ******************************************************************************************
// File         : child_component.svh
// Author       : RyanHunter
// Creating Date: Tue Apr  7 09:08:01 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef child_component__svh
`define child_component__svh

class child_component extends uvm_component; // {


	`uvm_component_utils_begin(child_component)
	`uvm_component_utils_end


	function new (string name = "child_component", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task reset_phase(uvm_phase phase);
	extern task main_phase(uvm_phase phase);

endclass // }


function void child_component::build_phase (uvm_phase phase); // {{{
	super.build_phase(phase);
endfunction // }}}


function void child_component::connect_phase (uvm_phase phase); // {{{
	super.connect_phase(phase);
endfunction // }}}


task child_component::reset_phase (uvm_phase phase); // {{{
	
endtask // }}}


task child_component::main_phase (uvm_phase phase); // {{{
	
endtask // }}}


`endif
