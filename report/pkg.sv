// ******************************************************************************************
// File         : pkg.sv
// Author       : RyanHunter
// Creating Date: Sat Sep 26 22:40:37 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef pkg__sv
`define pkg__sv


package pkg; // {

	`include "uvm_macros.svh"
	import uvm_pkg::*;

	`include "comps/sequence_item.sv"
	`include "comps/monitor.sv"
	`include "comps/driver.sv"
	`include "comps/sequencer.sv"
	`include "comps/agent.sv"
	`include "comps/env.sv"
	`include "comps/test_base.sv"


endpackage // }

`endif
