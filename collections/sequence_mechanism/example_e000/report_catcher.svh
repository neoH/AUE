// ******************************************************************************************
// File         : report_catcher.svh
// Author       : RyanHunter
// Creating Date: Thu Apr 23 08:39:31 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef report_catcher__svh
`define report_catcher__svh

`include "uvm_macros.svh"

import uvm_pkg::*;

class report_catcher extends uvm_report_catcher; // {

	bit masked_ids[string];



	function new (string name = "report_catcher" ); // {
		super.new(name);
	endfunction // }


	virtual function action_e catch(); // {
		string cid = super.get_id();
		if (masked_ids.exists(cid)) return CAUGHT;
		else return THROW;
	endfunction // }


	// for temporary test, this function only to add ids no matter what verbosity is
	function void add_mask(string id); // {
		if (!masked_ids.exists(id))
			masked_ids[id] = 1'b1;
	endfunction // }


endclass // }


`endif
