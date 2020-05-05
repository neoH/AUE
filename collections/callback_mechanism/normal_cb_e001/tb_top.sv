// ******************************************************************************************
// File         : tb_top.sv
// Author       : RyanHunter
// Creating Date: Wed Apr 22 09:57:13 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef tb_top__sv
`define tb_top__sv


//`include "uvm_macros.svh"

module tb_top; // {
	//import uvm_pkg::*;

	my_if mif();

	initial begin // {
		run_test("my_test");
	end // }


	initial begin // {
		uvm_resource_db #(virtual my_if)::set_override_type("","MY_IF",mif);
	end // }

	initial begin // {
		mif.RSTN = 1'b0;
		mif.CLK  = 1'b0;
		#500ns;
		mif.RSTN = 1'b1;
		#2000ns;
		mif.RSTN = 1'b0;
		#300ns;
		mif.RSTN = 1'b1;
	end // }

	always #5ns mif.CLK <= ~mif.CLK;


endmodule // }



`endif
