// ******************************************************************************************
// File         : driver.sv
// Author       : RyanHunter
// Creating Date: Sat Sep 26 10:18:03 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef driver__sv
`define driver__sv

class driver #(type REQ = req_item, RSP = rsp_item) extends uvm_driver #(REQ,RSP); // {

	`uvm_component_utils(driver#(REQ,RSP))


	function new (string name = "driver", uvm_component parent = null); // {
		super.new(name,parent);
	endfunction // }

endclass // }

`endif
