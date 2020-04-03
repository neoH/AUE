// ******************************************************************************************
// File         : fetch_agt.svh
// Author       : Ryan
// Creating Date: Fri Apr  3 08:38:43 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************

`ifndef fetch_agt__svh
`define fetch_agt__svh


class fetch_agt extends uvm_agent; // {

	fetch_drv  m_drv;
	fetch_seqr m_seqr;


	`uvm_component_utils(fetch_agt)

	function new (string name = "fetch_agt", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	function void build_phase (uvm_phase phase); // {
		super.build_phase(phase);

		m_drv = fetch_drv::type_id::create("m_drv",this);
		m_seqr = fetch_seqr::type_id::create("m_seqr",this);
	endfunction // }

	function void connect_phase (uvm_phase phase); // {
		m_drv.seq_item_port.connect(m_seqr.seq_item_export);
	endfunction // }


endclass // }

`endif
