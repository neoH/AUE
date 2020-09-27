// ******************************************************************************************
// File         : sequencer.sv
// Author       : RyanHunter
// Creating Date: Sat Sep 26 10:53:17 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef sequencer__sv
`define sequencer__sv


class sequencer #(type REQ = req_item, RSP = rsp_item) extends uvm_sequencer #(REQ,RSP); // {

	`uvm_component_utils(sequencer)


	function new (string name = "sequencer", uvm_component parent = null);
		super.new(name,parent);
	endfunction


endclass // }

`endif
