// ******************************************************************************************
// File         : report_summary_overload.sv
// Author       : RyanHunter
// Creating Date: Sat Sep 26 11:03:55 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef report_summary_overload__sv
`define report_summary_overload__sv

// for this case, to create a new class extends from report server, and use this instead of the
// default report server, and then overload the summarize function
class report_server extends uvm_default_report_server; // {

	function new (string name = "report_server");
		super.new(name);
	endfunction

	virtual function void report_summarize(UVM_FILE file = UVM_STDOUT); // {
		$display(" -------------------------------------------------------- ");
		$display(" -------------------------------------------------------- ");
		$display("  ______          __");
		$display("//      \\       //  \\\\");
		$display("||       ||    //    \\\\");
		$display("||       ||   //      \\\\");
		$display("||______//   // ______ \\\\");
		$display("||          //          \\\\");
		$display("||         //            \\\\");
		$display("||        //              \\\\");
		$display(" -------------------------------------------------------- ");
		$display(" -------------------------------------------------------- ");
	endfunction // }

endclass // }

class report_summary_overload extends test_base; // {

	`uvm_component_utils(report_summary_overload)

	function new (string name = "report_summary_overload", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	virtual function void build_phase (uvm_phase phase);
		report_server svr = new("new_svr");
		super.build_phase(phase);
		// set the new report server as the default one
		uvm_report_server::set_server(svr);
	endfunction

	virtual task do_main_phase(); // {
	endtask // }

endclass // }

`endif
