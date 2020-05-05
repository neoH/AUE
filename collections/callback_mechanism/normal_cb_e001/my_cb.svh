// ******************************************************************************************
// File         : my_cb.svh
// Author       : RyanHunter
// Creating Date: Mon May  4 23:00:32 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef my_cb__svh
`define my_cb__svh


// callback class must extends from uvm_callback, which will be stored and operated in uvm_callbacks
// later
class my_cb extends uvm_callback; // {

	function new(string name = "my_cb"); super.new(name); endfunction


	virtual function void cb_display(input int opt); // {
		`uvm_info("CALLBACK",$sformatf("now the callback was called with arg: %0d",opt),UVM_LOW)
	endfunction // }


endclass // }

class my_cb1 extends my_cb; // {

	function new(string name = "my_cb1"); super.new(name); endfunction

	virtual function void cb_display(input int opt); // {
		`uvm_info("CALLBACK",$sformatf("now called my_cb1, arg: %0d",opt),UVM_LOW)
	endfunction // }

endclass // }

class my_cb2 extends my_cb; // {
	function new(string name = "my_cb2"); super.new(name); endfunction

	virtual function void cb_display(input int opt); // {
		`uvm_info("CALLBACK",$sformatf("now called my_cb2, arg: %0d",opt),UVM_LOW)
	endfunction // }
endclass // }




`endif
