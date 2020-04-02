// ******************************************************************************************
// File         : sce_pcr_if.sv
// Author       : Ryan
// Creating Date: Tue Mar 31 22:00:12 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************
// power manage, clock and reset signal
// ******************************************************************************************

`ifndef sce_pcr_if__sv
`define sce_pcr_if__sv

interface sce_pcr_if (); // {

	logic CLK;
	logic RSTN;

	// TMP declare for directional ports, need debug
	modport G(input CLK, input RSTN);


endinterface // }

`endif
