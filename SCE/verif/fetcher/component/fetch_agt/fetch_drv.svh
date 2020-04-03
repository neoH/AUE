// ******************************************************************************************
// File         : fetch_drv.svh
// Author       : Ryan
// Creating Date: Thu Apr  2 20:13:43 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef fetch_drv__svh
`define fetch_drv__svh



class fetch_drv #(type REQ = fetch_seq_item, RSP = REQ )
	extends uvm_driver #(REQ,RSP); // {

	// PIFP, power interface parameter
	// FIFP, fetch interface parameter
	virtual sce_pcr_if   PIF;
	virtual sce_fetch_if FIF;

	`uvm_component_utils_begin(fetch_drv)
	`uvm_component_utils_end



	function new (string name = "fetch_drv", uvm_component parent = null);
		super.new(name,parent);
	endfunction


	extern function void build_phase (uvm_phase phase);
	extern function void connect_phase (uvm_phase phase);

	extern task reset_phase (uvm_phase phase);
	extern task main_phase (uvm_phase phase);


endclass // }

////////////////////////////////
// IMPLEMENTATION
////////////////////////////////


function void fetch_drv::build_phase (uvm_phase phase); // {{{
	super.build_phase(phase);

endfunction // }}}

function void fetch_drv::connect_phase (uvm_phase phase); // {{{
	super.connect_phase (phase);

	//                                                   /*scope*/ /*name*/   /*value*/
	uvm_resource_db #(virtual sce_fetch_if)::read_by_name(""      ,"FETCH_IF",FIF      );
	uvm_resource_db #(virtual sce_pcr_if)::read_by_name(""        ,"POWER_IF",PIF      );

endfunction // }}}


task fetch_drv::reset_phase (uvm_phase phase); // {{{
	super.reset_phase(phase);
	FIF.RSP_VLD  = 1'b0;
	FIF.RSP_INFO = 'h0;
	FIF.REQ_ACK  = 1'b0;
endtask // }}}


task fetch_drv::main_phase (uvm_phase phase); // {{{
	forever begin // {
		bit [31:0]   val = 0;
		int unsigned delay = 0;

		@(posedge PIF.CLK);
		if (FIF.REQ_VLD === 1'b0) continue; // if not req valid, then wait for next loop
		seq_item_port.try_next_item(req);
		if (req == null) begin // {
			// if not received control info from top of this, then use default random value
			val   = $urandom; // delay is always 0
			delay = 0;
		// }
		end else begin // {
			val = req.dat;
			delay = req.delay;
		end // }
		repeat (delay) @(posedge PIF.CLK);
		FIF.RSP_VLD <= 1'b1;
		FIF.RSP_INFO <= val;
		do
			@(posedge PIF.CLK);
		while (FIF.RSP_ACK === 1'b1);
		FIF.RSP_VLD  <= 1'b0;
		FIF.RSP_INFO <= 'h0;
		seq_item_port.item_done();
	end // }
endtask // }}}

`endif
