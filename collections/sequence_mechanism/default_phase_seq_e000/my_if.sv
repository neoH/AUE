// ******************************************************************************************
// File         : my_if.sv
// Author       : RyanHunter
// Creating Date: Sat May  2 06:59:25 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef my_if__sv
`define my_if__sv

interface my_if(); // {


	logic CLK,RSTN;

	// request channel
	logic [31:0] ADDR;
	logic [31:0] WDATA;
	logic WRITE;
	logic SEL;

	// response channel
	// response must be returned next cycle of the request
	logic [31:0] RDATA;
	logic OKAY;

	clocking cb @(posedge CLK); // {
	endclocking // }

endinterface // }

`endif
