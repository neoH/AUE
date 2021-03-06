// ******************************************************************************************
// File         : fetch_seqr.svh
// Author       : Ryan
// Creating Date: Thu Apr  2 20:13:48 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************

`ifndef fetch_seqr__svh
`define fetch_seqr__svh


class fetch_seqr extends uvm_sequencer #(fetch_seq_item); // {

	`uvm_component_utils(fetch_seqr)

	function new (string name = "fetch_seqr", uvm_component parent = null);
		super.new(name,parent);
	endfunction

endclass // }

`endif
