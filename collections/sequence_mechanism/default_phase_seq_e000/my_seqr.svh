// ******************************************************************************************
// File         : my_seqr.svh
// Author       : RyanHunter
// Creating Date: Sat May  2 06:59:07 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef my_seqr__svh
`define my_seqr__svh

class my_seqr extends uvm_sequencer #(my_req,my_rsp); // {


	`uvm_component_utils(my_seqr)

	function new (string name = "my_seqr", uvm_component parent = null); // {
		super.new(name,parent);
	endfunction // }

endclass // }


`endif
