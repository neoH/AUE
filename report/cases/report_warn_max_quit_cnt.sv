// ******************************************************************************************
// File         : report_warn_max_quit_cnt.sv
// Author       : RyanHunter
// Creating Date: Sun Sep 27 21:56:41 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef report_warn_max_quit_cnt__sv
`define report_warn_max_quit_cnt__sv

class report_warn_max_quit_cnt extends test_base; // {


	`uvm_component_utils(report_warn_max_quit_cnt)

	function new (string name = "report_warn_max_quit_cnt", uvm_component parent = null);
		super.new(name,parent);
	endfunction


	virtual task do_main_phase(); // {
		uvm_report_server svr = uvm_report_server::get_server();
		//uvm_root top = uvm_root::get();
		this.m_rh.set_severity_action(UVM_WARNING, UVM_DISPLAY|UVM_COUNT);
		svr.set_max_quit_count(10);

		for (int i=0;i<20;i++) begin // {
			`uvm_warning("TESTW",$sformatf("warning index %0d",i))
		end // }

	endtask // }


endclass // }

`endif
