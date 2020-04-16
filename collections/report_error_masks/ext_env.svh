// ******************************************************************************************
// File         : ext_env.svh
// Author       : RyanHunter
// Creating Date: Mon Apr 13 10:05:02 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef ext_env__svh
`define ext_env__svh

class ext_env extends uvm_env; // {

	uvm_root mr = uvm_root::get();

	`uvm_component_utils_begin(ext_env)
	`uvm_component_utils_end


	function new (string name = "ext_env", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task reset_phase(uvm_phase phase);
	extern task main_phase(uvm_phase phase);

endclass // }


function void ext_env::build_phase (uvm_phase phase); // {{{
	super.build_phase(phase);
endfunction // }}}


function void ext_env::connect_phase (uvm_phase phase); // {{{
	super.connect_phase(phase);
endfunction // }}}


task ext_env::reset_phase (uvm_phase phase); // {{{
	
endtask // }}}


task ext_env::main_phase (uvm_phase phase); // {{{

	#100ns;
	mr.uvm_report_info(get_type_name(),"now we will report 2 error message here, ID: UNMASKED and MASKED");
	mr.uvm_report_error("MASKED","this is the masked message, if displayed, then this test failed");
	mr.uvm_report_error("UNMASKED","this is the unmasked message, should be displayed");
	mr.uvm_report_info(get_type_name(),"you should see the ID::MASKED messages are all masked");
	
endtask // }}}


`endif
