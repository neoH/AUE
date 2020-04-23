// ******************************************************************************************
// File         : tb_top.sv
// Author       : RyanHunter
// Creating Date: Wed Apr 22 09:57:13 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef tb_top__sv
`define tb_top__sv


`include "uvm_macros.svh"

module tb_top; // {

	report_catcher rc = new("rc");
	import uvm_pkg::*;

	initial begin // {
		#1us;
		$finish;
	end // }


	initial begin // {
		uvm_report_cb::add(null,rc);
		`uvm_info("TESTID","reported this test ID",UVM_LOW)
		rc.add_mask("TESTID");
		`uvm_info("TESTID2","ID: TESTID masked",UVM_LOW)
		`uvm_info("TESTID","reported this test ID, if printed, then failed",UVM_LOW)
	end // }




endmodule // }



`endif
