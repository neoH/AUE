// ******************************************************************************************
// File         : parent_component.svh
// Author       : RyanHunter
// Creating Date: Tue Apr  7 09:08:08 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef parent_component__svh
`define parent_component__svh

class parent_component extends uvm_component; // {

	child_component cc0;

	`uvm_component_utils_begin(parent_component)
	`uvm_component_utils_end


	function new (string name = "parent_component", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task reset_phase(uvm_phase phase);
	extern task main_phase(uvm_phase phase);


	function void register_child(); // {
		cc0 = child_component::type_id::create("cc0",this);
	endfunction // }

	function void display(); // {
		uvm_report_info(get_full_name(),"getting the component");
	endfunction // }

endclass // }


function void parent_component::build_phase (uvm_phase phase); // {{{
	super.build_phase(phase);


endfunction // }}}


function void parent_component::connect_phase (uvm_phase phase); // {{{
	super.connect_phase(phase);
endfunction // }}}


task parent_component::reset_phase (uvm_phase phase); // {{{
	
endtask // }}}


task parent_component::main_phase (uvm_phase phase); // {{{
	
endtask // }}}


`endif
