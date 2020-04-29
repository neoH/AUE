// ******************************************************************************************
// File         : fetch_issue_if.sv
// Author       : RyanHunter
// Creating Date: Wed Apr 29 22:27:38 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef fetch_issue_if__sv
`define fetch_issue_if__sv

interface fetch_issue_if(); // {

	logic CLK;
	logic RSTN;

	logic INSTRV;
	logic [31:0] DEC_INSTR;
	logic ISSUE_BUSY;



	clocking cb @(posedge CLK); // {
	endclocking // }

	modport fetch (
		input RSTN, ISSUE_BUSY,
		output INSTRV, DEC_INSTR,
		clocking cb
	);



endinterface // }

`endif
