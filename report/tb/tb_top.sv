// ******************************************************************************************
// File         : tb_top.sv
// Author       : RyanHunter
// Creating Date: Sat Sep 26 09:53:05 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef tb_top__sv
`define tb_top__sv


`include "uvm_macros.svh"
import uvm_pkg::*;
import pkg::*;

module tb_top; // {




	initial begin // {
		run_test();
	end // }

endmodule // }

`endif
