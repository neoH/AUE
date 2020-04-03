// ******************************************************************************************
// File         : fetch_pkg.sv
// Author       : Ryan
// Creating Date: Fri Apr  3 08:19:55 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************



`ifndef fetch_pkg__sv
`define fetch_pkg__sv

`include "uvm_macros.svh"
package fetch_pkg; // {

	import uvm_pkg::*;

	`include "fetch_seq_item.svh"
	`include "fetch_seqr.svh"
	`include "fetch_drv.svh"
	`include "fetch_agt.svh"

endpackage // }

`endif
