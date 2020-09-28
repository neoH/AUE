// ******************************************************************************************
// File         : report_error_max_quit_cnt.sv
// Author       : RyanHunter
// Creating Date: Sun Sep 27 20:33:59 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef report_error_max_quit_cnt__sv
`define report_error_max_quit_cnt__sv


class report_error_max_quit_cnt extends test_base; // {


	`uvm_component_utils(report_error_max_quit_cnt)


	function new (string name = "report_error_max_quit_cnt", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	virtual function void build_phase (uvm_phase phase); // {
		uvm_report_server svr = uvm_report_server::get_server();
		super.build_phase(phase);
		svr.set_max_quit_count(10);
	endfunction // }

	virtual task do_main_phase(); // {

		for (int i=0;i<20;i++) begin // {
			`uvm_error("TESTE",$sformatf("error num %0d",i))
		end // }
	endtask // }


endclass // }

`endif
