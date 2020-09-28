// ******************************************************************************************
// File         : report_proc_report_message.sv
// Author       : RyanHunter
// Creating Date: Sun Sep 27 22:52:19 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef report_proc_report_message__sv
`define report_proc_report_message__sv


class rprm_report_server extends uvm_default_report_server; // {


	function new (string name = "rprm_report_server");
		super.new(name);
	endfunction

	virtual function void pre_proc_report_message(); // {
		$display("do pre_proc_report_message");
	endfunction // }

	virtual function void post_proc_report_message(); // {
		$display("do post_proc_report_message");
	endfunction // }

	virtual function void process_report_message (uvm_report_message report_message); // {
		pre_proc_report_message();
		super.process_report_message(report_message);
		post_proc_report_message();
	endfunction // }


endclass // }


class report_proc_report_message extends test_base; // {


	`uvm_component_utils(report_proc_report_message)


	function new (string name = "report_proc_report_message", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	virtual task do_main_phase(); // {
		rprm_report_server svr = new("svr");
		uvm_report_server::set_server(svr);
		`uvm_info("TESTI","display after overloading",UVM_LOW)
	endtask // }

endclass // }



`endif
