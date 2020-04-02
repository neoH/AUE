// ******************************************************************************************
// File         : sce_fetch_if.sv
// Author       : Ryan
// Creating Date: Tue Mar 31 22:15:24 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************

`ifndef sce_fetch_if__sv
`define sce_fetch_if__sv

interface sce_fetch_if (); // {

	parameter CMDW = 32;

	// request/response can be accomplished only when ACK is high
	logic REQ_VLD;
	logic REQ_ACK;

	logic RSP_VLD;
	logic RSP_ACK;

	logic [CMDW - 1 : 0] REQ_INFO;
	logic [CMDW - 1 : 0] RSP_INFO;


endinterface // }


`endif
