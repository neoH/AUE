// ******************************************************************************************
// File         : sce_fetcher.sv
// Author       : Ryan
// Creating Date: Tue Mar 31 21:53:41 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


// FILE HEADER
`ifndef sce_fetcher__sv
`define sce_fetcher__sv

// PIF: power IF, clock, reset
// FIF: fetch IF, fetch command sending, rsp receiving etc.
// DIF: decoder IF, rsp sending
//
module sce_fetcher (sce_pcr_if PIF, sce_fetch_if FIF, sce_dec_if DIF); // {

	parameter PAW = 32;

	/* interface protocol */
	// for command fetching

	/**********************/


	// internal signals
	//

	// PC, the instruction address, is the PA[PAW-1:2];
	logic [PAW - 1 : 2] r_PC;

	bit debug_enable = 'b1; // debug semaphore signal

	// always block to send fetch request
	// always @(posedge PIF.CLK or negedge PIF.RSTN) begin // {
	// 	if (~PIF.RSTN) begin // {
	// 		// async reset actions for fetch control signals
	// 		FIF.REQV <= 1'b0;
	// 		FIF.REQ_INFO <= {sce_fetch_if::CMDW{1'b0}};
	// 		r_PC <= {(PAW-2)'{1'b0}};
	// 	// }
// 	end else begin // {
	// 		// conditions of control fetch request and fetch command
	// 		// condition of fetch:
	// 		// 1. decode side is valid
	// 		// 2. ACK is high
// 	end // }
// end // }

	process main_thread;

	/***********************/
	/* METHODS DECLARATION */
	/***********************/

	// TASK: reset
	// this is a reset detection task to detect reset signal and then kill the
	// main process
	task reset(); // {{{
		forever begin // {
			wait (PIF.RSTN === 1'b0);
			if (main_thread.status() != process::FINISHED) begin // {
				if (debug_enable)
					$display($realtime," [SCE_FETCHER], detecting reset event");
				// kill thread and then initial all signals
				main_thread.kill();
			end // }
			// nomatter the main_thread should be killed or not,
			// once the RSTN is 0, all corresponding signals should be reset.
			r_PC = 'h0;
			FIF.REQ_VLD  = 1'b0;
			FIF.REQ_INFO = 'h0;
			wait (PIF.RSTN === 1'b1); // wait signal valid
		end // }
	endtask // }}}


	task send(); // {{{
		// sending feature
		forever begin // {
			@(posedge PIF.CLK);
			if (FIF.REQ_ACK & DIF.DEC2FET_VLD) begin // {
				FIF.REQ_VLD  <= 1'b1;
				FIF.REQ_INFO <= {2'h0,r_PC};
				r_PC++;
			// }
			end else begin // {
				// clear request
				FIF.REQ_VLD  <= 1'b0;
				FIF.REQ_INFO <= 'h0;
			end // }

		end // }

	endtask // }}}

	logic [31:0] fifo[$];

	// rcv
	task rcv(); // {{{
		// receiving feature
		// when RSP_VLD,
		forever begin // {
			@(posedge PIF.CLK);
			if (FIF.RSP_VLD) begin // {
				fifo.push_back(FIF.RSP_INFO);
				FIF.RSP_ACK <= 1'b1;
			end // }
		end // }
	endtask // }}}

	// TASK: main_proc
	// main processor
	//
	task main_proc(); // {{{
		// send fetch valid & command
		// receive response
		// send received commands to decoder
		fork // {
			send(); // send thread
			rcv();  // receive thread
		join // }
	endtask // }}}


	/*******************/
	/* BLOCK EXECUTION */
	/*******************/

	initial begin // {
		fork // {
			reset();
			begin // {
				wait (PIF.RSTN === 1'b1); // wait reset invalid
				main_thread = process::self();
				main_proc();
			end // }
		join // }
	end // }


endmodule // }

`endif //
