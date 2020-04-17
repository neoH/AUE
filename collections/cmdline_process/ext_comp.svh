// ******************************************************************************************
// File         : ext_comp.svh
// Author       : RyanHunter
// Creating Date: Fri Apr 17 09:27:55 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef ext_comp__svh
`define ext_comp__svh


class ext_comp extends uvm_component; // {

	// @ryan, this is just a simple component


	`uvm_component_utils(ext_comp)

	function new (string name = "ext_comp", uvm_component parent = null); // {
		super.new(name,parent);
	endfunction // }


endclass // }




`endif
