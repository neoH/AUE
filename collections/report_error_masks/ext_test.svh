// ******************************************************************************************
// File         : ext_test.svh
// Author       : RyanHunter
// Creating Date: Mon Apr 13 09:48:56 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef ext_test__svh
`define ext_test__svh

class ext_test extends uvm_test; // {

	ext_env m_env;
	uvm_root mr = uvm_root::get();

	`uvm_component_utils_begin(ext_test)
	`uvm_component_utils_end


	function new (string name = "ext_test", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task reset_phase(uvm_phase phase);
	extern task main_phase(uvm_phase phase);




endclass // }


function void ext_test::build_phase (uvm_phase phase); // {{{

	super.build_phase(phase);
	m_env = ext_env::type_id::create("m_env",this);

	mr.uvm_report_info(get_type_name(),$sformatf("setting severity id to UVM_NO_ACTION, root:%0d",mr));
	mr.set_report_severity_id_action(UVM_ERROR,"MASKED",0);
endfunction // }}}


function void ext_test::connect_phase (uvm_phase phase); // {{{
	super.connect_phase(phase);
endfunction // }}}


task ext_test::reset_phase (uvm_phase phase); // {{{
	phase.raise_objection(this);

	mr.uvm_report_info(get_type_name(),"entering reset_phase ... ...",UVM_LOW);

	#10ns;

	phase.drop_objection(this);
	
endtask // }}}



task ext_test::main_phase (uvm_phase phase); // {{{
	phase.raise_objection(this);
	mr.uvm_report_info(get_type_name(),"entering main_phase ... ...",UVM_LOW);
	// rewrite the phase_start task
	
	#100ns;

	mr.uvm_report_error("UNMASKED","this is unmasked message, next message from test should be masked");
	mr.uvm_report_error("MASKED","if you see this, this example goes wrong");
	mr.uvm_report_warning("MASKED","this should not be masked because it's a warning");
	mr.uvm_report_info("MASKED","this should not be masked because it's a info");

	phase.drop_objection(this);
endtask // }}}


`endif
