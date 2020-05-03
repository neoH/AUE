// ******************************************************************************************
// File         : my_test.svh
// Author       : RyanHunter
// Creating Date: Sat May  2 06:58:48 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef my_test__svh
`define my_test__svh

class my_test extends uvm_test; // {


	my_env m_env;

	my_main_seq main_seq;

	`uvm_component_utils(my_test)

	function new (string name = "my_test", uvm_component parent = null); // {
		super.new(name,parent);
	endfunction // }

	extern function void build_phase (uvm_phase phase);
	extern task reset_phase (uvm_phase phase);

endclass // }

task my_test::reset_phase (uvm_phase phase); // {
	phase.raise_objection(this);
	`uvm_info("RESET","entering reset phase ... ...",UVM_LOW)
	#500ns;
	`uvm_info("RESET","leaving reset phase ... ...",UVM_LOW)
	phase.drop_objection(this);
endtask // }


function void my_test::build_phase (uvm_phase phase); // {
	super.build_phase(phase);

	m_env = my_env::type_id::create("m_env",this);

	main_seq = new("main_seq");

	// set default main_phase sequence
	uvm_config_db #(my_main_seq)::set({get_full_name(),"m_env.m_seqr.main_phase"},
		"","default_sequence",main_seq
	);
endfunction // }

task my_test::main_phase (uvm_phase phase); // {
	uvm_domain domain;
	phase.raise_objection(this);
	#500ns;

	// jump
	domain = uvm_domain::get_common_domain();
	domain.jump(uvm_reset_phase::get());

	phase.drop_objection(this);
endtask // }



`endif
