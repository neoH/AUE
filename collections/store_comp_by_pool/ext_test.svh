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
	ext_comp mc;

	super.build_phase(phase);
	m_env = ext_env::type_id::create("m_env",this);


	mc = ext_comp::type_id::create("mc",this);

	begin // {
		// @ryan, can also use a uvm_object_string_pool here
		uvm_pool #(string,ext_comp) gp = uvm_pool#(string,ext_comp)::get_global_pool();
		gp.add("EXT_COMP",mc);
		uvm_report_info(get_type_name(),$sformatf("setting the ext_comp to pool, the handle is %0d",mc));
	end // }


endfunction // }}}


function void ext_test::connect_phase (uvm_phase phase); // {{{
	super.connect_phase(phase);
endfunction // }}}


task ext_test::reset_phase (uvm_phase phase); // {{{
	phase.raise_objection(this);


	phase.drop_objection(this);
	
endtask // }}}



task ext_test::main_phase (uvm_phase phase); // {{{
	phase.raise_objection(this);

	phase.drop_objection(this);
endtask // }}}


`endif
