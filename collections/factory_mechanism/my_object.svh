// ******************************************************************************************
// File         : my_object.svh
// Author       : RyanHunter
// Creating Date: Tue Apr  7 09:10:30 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef my_object__svh
`define my_object__svh

class my_object extends uvm_object; // {


	`uvm_object_utils_begin(my_object)
	`uvm_object_utils_end


	function new (string name = "my_object");
		super.new(name);
	endfunction

	function void seq_find_by_name(); // {
		uvm_factory f = uvm_factory::get();
		parent_component pc;
		$cast (pc, f.find_by_name("parent_component"));
		if (pc != null) pc.display();
		else uvm_report_error(get_full_name(),"cast failed");
	endfunction // }

	function void test_00(); // {
		seq_find_by_name();
	endfunction // }



endclass // }


`endif
