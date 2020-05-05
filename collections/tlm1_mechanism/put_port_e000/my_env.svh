// ******************************************************************************************
// File         : my_env.svh
// Author       : RyanHunter
// Creating Date: Sat May  2 06:59:18 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef my_env__svh
`define my_env__svh


class my_env extends uvm_env; // {


	my_drv  m_drv;
	my_seqr m_seqr;

	uvm_nonblocking_put_imp #(int, my_env) m_nimp;


	`uvm_component_utils(my_env)

	function new (string name = "my_env", uvm_component parent = null); // {
		super.new(name,parent);
	endfunction // }

	function void build_phase (uvm_phase phase); // {
		super.build_phase(phase);

		m_drv = my_drv::type_id::create("m_drv",this);

		m_seqr = my_seqr::type_id::create("m_seqr",this);

		m_nimp = new("m_nimp",this);

	endfunction // }

	function void connect_phase (uvm_phase phase); // {
		super.connect_phase (phase);

		m_drv.seq_item_port.connect(m_seqr.seq_item_export);
		m_drv.m_nport.connect(m_nimp);

	endfunction // }

	virtual task put (input int _t); // {
		`uvm_info("PUT",$sformatf("here's a put call, arg: %0d",_t),UVM_LOW)
	endtask // }

	virtual function bit try_put (input int _t); // {
	endfunction // }

	virtual function bit can_put (); // {
	endfunction // }




endclass // }



`endif
