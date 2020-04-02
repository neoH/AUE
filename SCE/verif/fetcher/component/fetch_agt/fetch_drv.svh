// ******************************************************************************************
// File         : fetch_drv.svh
// Author       : Ryan
// Creating Date: Thu Apr  2 20:13:43 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef fetch_drv__svh
`define fetch_drv__svh



class fetch_drv #(type REQ = fetch_req_item, RSP = fetch_rsp_item, PIFP,FIFP)
	extends uvm_driver #(REQ,RSP); // {

	// PIFP, power interface parameter
	// FIFP, fetch interface parameter
	virtual PIFP PIF;
	virtual FIFP FIF;

	`uvm_component_utils_begin(fetch_drv)
		`uvm_field_object(IF,UVM_PRINT) // for print only
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

	//                                            /*scope*/ /*name*/   /*value*/
	uvm_resource_db #(virtual FIFP)::read_by_name(""      ,"FETCH_IF",FIF      );
	uvm_resource_db #(virtual PIFP)::read_by_name(""      ,"POWER_IF",PIF      );

endfunction // }}}


task fetch_drv::reset_phase (uvm_phase phase); // {{{
	super.reset_phase(phase);
	IF.RSP_VLD  = 1'b0;
	IF.RSP_INFO = 'h0;
	IF.REQ_ACK  = 1'b0;
endtask // }}}


task fetch_drv::main_phase (uvm_phase phase); // {{{
	forever begin // {
	end // }
endtask // }}}

`endif
