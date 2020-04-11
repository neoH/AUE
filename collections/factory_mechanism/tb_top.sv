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


	my_component mc;

	initial begin // {
		mc = new("mo");
		mc.test_00();
	end // }



endmodule // }

`endif
