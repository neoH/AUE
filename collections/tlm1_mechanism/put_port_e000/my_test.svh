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
	virtual my_if  vif;

	my_main_seq main_seq;
	bit m_reset_e = 1'b0;

	`uvm_component_utils(my_test)

	function new (string name = "my_test", uvm_component parent = null); // {
		super.new(name,parent);
	endfunction // }

	extern function void build_phase (uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task reset_phase(uvm_phase phase);
	extern task main_phase (uvm_phase phase);

endclass // }

function void my_test::connect_phase (uvm_phase phase); // {
	super.connect_phase(phase);
	if (!(uvm_resource_db #(virtual my_if)::read_by_name("","MY_IF",vif))) begin // {
		`uvm_fatal("FATAL","cannot get interface in my_test")
	end // }

endfunction // }


function void my_test::build_phase (uvm_phase phase); // {
	super.build_phase(phase);

	m_env = my_env::type_id::create("m_env",this);


endfunction // }

task my_test::reset_phase(uvm_phase phase); // {
	`uvm_info("RESET","entering reset_phase ...", UVM_LOW)
	phase.raise_objection(this);
	#200ns;
	phase.drop_objection(this);
	`uvm_info("RESET","leaving reset_phase ...", UVM_LOW)
endtask // }


task my_test::main_phase (uvm_phase phase); // {
	int itr;
	`uvm_info("MAIN","entering main_phase ...", UVM_LOW)
	phase.raise_objection(this);




	phase.drop_objection(this);
	`uvm_info("MAIN","leaving main_phase ...", UVM_LOW)
endtask // }



`endif
