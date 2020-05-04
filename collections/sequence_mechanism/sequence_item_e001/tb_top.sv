// ******************************************************************************************
// File         : tb_top.sv
// Author       : RyanHunter
// Creating Date: Tue Apr  7 09:05:59 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef tb_top__sv
`define tb_top__sv


module tb_top; // {



	initial begin // {
		// post_build_phase phase inserting
		uvm_domain cd = uvm_domain::get_common_domain();
		cd.add(my_post_build_phase::get(),/*null with_phase*/,
			cd.find(uvm_build_phase::get()),cd.find(uvm_connect_phase::get()));
		run_test("ext_test");
	end // }



endmodule // }

`endif
