// ******************************************************************************************
// File         : fetch_bseq.svh
// Author       : RyanHunter
// Creating Date: Mon Apr  6 19:55:04 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef fetch_bseq__svh
`define fetch_bseq__svh

typedef class fetch_seqr;

class fetch_bseq extends uvm_sequence; // {

	// get sequencer here

	fetch_seq_item SEQ;


	`uvm_object_begin(uvm_sequence)
	`uvm_object_end

	function fetch_seqr __get_default_seqr(); // {
		fetch_seqr seqr = uvm_factory::find_wrapper_by_name("fetch_seqr");
		if (seqr == null) begin uvm_report_fatal("NSEQR","cannot get default sequencer for fetch_bseq");
		return seqr;
	endfunction // }

	function new (string name = "fetch_bseq");
		super.new(name);
	endfunction

	virtual task start (uvm_sequencer seqr = null); // {
		if (seqr == null) begin // {
			seqr = __get_default_seqr();
		end // }
		super.start(seqr);
	endtask // }

	task body(); // {
		SEQ = new("seq");
		SEQ.start_item();
		SEQ.start();
		SEQ.end_item();
	endtask // }


endclass // }


`endif
