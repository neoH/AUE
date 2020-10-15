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

	`include "env/comps/sequence_item.sv"
	`include "env/comps/monitor.sv"
	`include "env/comps/driver.sv"
	`include "env/comps/sequencer.sv"
	`include "env/comps/agent.sv"
	`include "env/comps/env.sv"
	`include "env/comps/test_base.sv"


endpackage // }

`endif
