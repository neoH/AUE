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

	uvm_report_info(get_type_name(),"step 1. uvm_cmdline_processor::get_arg_matches examples");
	uvm_report_info(get_type_name(),"this is a function that will return all matched strings by");
	uvm_report_info(get_type_name(),"the pattern you entered");

	begin // {
		string org_q[$];
		string msg;
		// @ryan,uvm_cmdline_processor cmdl = uvm_cmdline_processor::get_inst();

		// @ryan, no necessary, org_q.push_back("ryan_hunter00");
		// @ryan, no necessary, org_q.push_back("ryan_");
		// @ryan, no necessary, org_q.push_back("ryan_");

		// @ryan, no necessary, foreach (org_q[i])
		// @ryan, no necessary, 	msg = {msg," ",org_q[i]};

		// @ryan, no necessary, uvm_report_info(get_type_name(),$sformatf("org string: %s",msg));

		if (!uvm_cmdline_proc.get_arg_matches("/ryan/",org_q)) uvm_report_fatal(get_type_name(),"no matched");

		msg = ""; // @ryan, clear msg first
		foreach (org_q[i])
			msg = {msg," ",org_q[i]};

		uvm_report_info(get_type_name(),$sformatf("matched string for pattern /ryan/: %s",msg));

		if (!uvm_cmdline_proc.get_arg_matches("+rll",org_q)) uvm_report_fatal(get_type_name(),"no matched");

		msg = ""; // @ryan, clear msg first
		foreach (org_q[i])
			msg = {msg," ",org_q[i]};

		uvm_report_info(get_type_name(),$sformatf("matched string for pattern +rll: %s",msg));


		uvm_report_info(get_type_name(),"get_args, which to get all args from cmdline");
		uvm_cmdline_proc.get_args(org_q);
		msg = ""; // @ryan, clear msg first
		foreach (org_q[i])
			msg = {msg," ",org_q[i]};
		uvm_report_info(get_type_name(),$sformatf("get args: %s",msg));

		uvm_report_info(get_type_name(),"get_plusargs, which to get all args prefixed with '+'");
		uvm_cmdline_proc.get_plusargs(org_q);
		msg = ""; // @ryan, clear msg first
		foreach (org_q[i])
			msg = {msg," ",org_q[i]};
		uvm_report_info(get_type_name(),$sformatf("get plusargs: %s",msg));

		uvm_report_info(get_type_name(),"get_uvm_args, which to get all args prefixed with '<*>UVM'");
		uvm_report_info(get_type_name(),"case insensitive");
		uvm_cmdline_proc.get_uvm_args(org_q);
		msg = ""; // @ryan, clear msg first
		foreach (org_q[i])
			msg = {msg," ",org_q[i]};
		uvm_report_info(get_type_name(),$sformatf("get uvm args: %s",msg));


	end // }



	phase.drop_objection(this);
endtask // }}}


`endif
