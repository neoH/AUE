// ******************************************************************************************
// File         : fetch_bseq.svh
// Author       : RyanHunter
// Creating Date: Mon Apr  6 19:55:04 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef fetch_bseq__svh
`define fetch_bseq__svh


class fetch_bseq extends uvm_sequence; // {

	// get sequencer here

	fetch_seq_item SEQ;


	`uvm_object_utils_begin(fetch_bseq)
	`uvm_object_utils_end

	function fetch_pkg::fetch_seqr __get_default_seqr(); // {
		uvm_factory factor = uvm_factory::get();
		fetch_pkg::fetch_seqr seqr;
		$cast (seqr,factor.find_by_name("fetch_seqr"));
		if (seqr == null) uvm_report_fatal("NSEQR","cannot get default sequencer for fetch_bseq");
		return seqr;
	endfunction // }

	function new (string name = "fetch_bseq");
		super.new(name);
	endfunction

	virtual task start (uvm_sequencer_base sequencer = null,
		uvm_sequence_base parent_sequence = null,
		int this_priority = -1,
		bit call_pre_post = 1); // {
		fetch_pkg::fetch_seqr default_seqr;
		if (sequencer == null) begin // {
			default_seqr = __get_default_seqr();
			super.start(default_seqr);
		end // }
		return;
	endtask // }

	task body(); // {
		SEQ = new("seq");
		start_item(SEQ);
		finish_item(SEQ);
	endtask // }


endclass // }


`endif
