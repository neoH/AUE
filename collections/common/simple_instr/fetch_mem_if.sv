// ******************************************************************************************
// File         : fetch_mem_if.sv
// Author       : RyanHunter
// Creating Date: Wed Apr 29 22:11:08 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef fetch_mem_if__sv
`define fetch_mem_if__sv

interface fetch_mem_if (); // {

	logic CLK;
	logic RSTN;

	logic REQV; // valid request signal
	logic [31:0] PC; // request information

	// invalid signal from memory side to fetcher, indicates that current
	// request should be hang due to some reason
	logic REQINV; 

	logic RSPV;

	// invalid response flag, same as REQINV
	logic RSPINV;
	logic [31:0] INSTR;

	clocking cb @(posedge CLK); // {
	endclocking // }

	modport fetch (
		input CLK, RSTN, REQINV, RSPV, INSTR,
		output REQV, PC, 
		clocking cb
	);

	modport mem (
		input CLK, RSTN, REQV, PC,
		output REQINV, RSPV, INSTR,
		clocking cb
	);



endinterface // }


`endif
