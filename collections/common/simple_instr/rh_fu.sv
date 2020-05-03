// ******************************************************************************************
// File         : rh_fu.sv
// Author       : RyanHunter
// Creating Date: Wed Apr 29 22:04:29 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef rh_fu__sv
`define rh_fu__sv


module RH_FU (
	fetch_mem_if.fetch fif,
	fetch_issue_if.fetch  iif
);

	int unsigned r_PC;

	// fetching instruction
	// every time when REQINV is not asserted, then sending the fetching command
	always @(fif.cb or negedge fif.RSTN) begin // {
		if (~fif.RSTN) begin // {
			// drive default
			fif.REQV <= 1'b0;
			fif.PC   <= 'h0;
			fif.r_PC <= 'h0;
		// }
		end else begin // {
			if (~fif.REQINV) begin // {
				fif.PC <= r_PC;
				fif.REQV <= 1'b1;
				r_PC++;
			// }
			end else begin // {
				fif.REQV <= 1'b0;
			end // }
		end // }
	end // }




endmodule

`endif
