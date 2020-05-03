// ******************************************************************************************
// File         : my_drv.svh
// Author       : RyanHunter
// Creating Date: Sat May  2 06:59:03 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef my_drv__svh
`define my_drv__svh


class my_drv extends uvm_driver #(my_req,my_rsp); // {


	virtual my_if vif;


	`uvm_component_utils(my_drv)

	function new (string name = "my_drv", uvm_component parent = null); // {
		super.new(name,parent);
	endfunction // }


	// 
	task m_driveAllX(); // {
		vif.WRITE = 1'bx;
		vif.SEL   = 1'bx;
		vif.ADDR  = 'hx;
		vif.WDATA = 'hx;
	endtask // }

	task m_driveAllDef(); // {
		vif.WRITE <= 1'b0;
		vif.SEL   <= 1'b0;
		vif.ADDR  <= 'h0;
		vif.WDATA <= 'h0;
	endtask // }


	extern task m_req_drive(bit [31:0] A, bit W, bit [31:0] D);
	extern task m_delayCyc (input int unsigned Cyc);


	function void build_phase (uvm_phase phase); super.build_phase(phase); endfunction

	function void connect_phase (uvm_phase phase); // {
		super.connect_phase(phase);
		void'(uvm_resource_db #(virtual my_if)::read_by_name("","MY_IF",vif));
	endfunction // }



	task reset_phase (uvm_phase phase); // {
		super.reset_phase(phase);

		phase.raise_objection(this);

		wait(vif.RSTN === 1'b0); // wait reset start
		m_driveAllX(); // drive all signal to this device to X value

		wait(vif.RSTN === 1'b1); // wait reset done
		@(vif.cb);
		m_driveAllDef(); // drive all output signal of this device to default value

		phase.drop_objection(this);

	endtask // }

	task main_phase (uvm_phase phase); // {
		forever begin // {
			// here is normal running phase
			seq_item_port.get_next_item(req);

			if (req.delayCyc) m_delayCyc(req.delayCyc);
			m_req_drive(req.PA,req.is_write,req.WD);

			seq_item_port.item_done();
		end // }
	endtask // }


endclass // }

task my_drv::m_delayCyc (int unsigned Cyc); // {
	repeat (Cyc) @(vif.cb);
endtask // }


task my_drv::m_req_drive(bit [31:0] A, bit W, bit [31:0] D); // {
	vif.ADDR  <= A;
	vif.WDATA <= D;
	vif.WRITE <= W;
	vif.SEL   <= 'b1;

	@(vif.cb);
	vif.ADDR  <= 'h0;
	vif.SEL   <= 'b0;
	vif.WRITE <= 'b0;
	vif.WDATA <= 'h0;

	// if need receive response, now start processing from here
	// TODO
endtask // }



`endif
