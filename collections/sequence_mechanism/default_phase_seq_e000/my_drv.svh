// ******************************************************************************************
// File         : my_drv.svh
// Author       : RyanHunter
// Creating Date: Sat May  2 06:59:03 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef my_drv__svh
`define my_drv__svh


class my_drv #(type IF = null) extends uvm_driver #(my_req,my_rsp); // {


	virtual IF vif;


	`uvm_component_utils(my_drv)

	function new (string name = "my_drv", uvm_component parent = null); // {
		super.new(name,parent);
	endfunction // }


	// 
	function void m_drvieAllX(); // {
	endfunction // }

	function void m_driveAllDef(); // {
	endfunction // }



	function void build_phase (uvm_phase phase); super.build_phase(phase); endfunction

	function void connect_phase (uvm_phase phase); // {
		super.connect_phase(phase);
		uvm_resource_db #(virtual IF)::find_by_name("","","MY_IF",vif);
	endfunction // }



	task reset_phase (uvm_phase phase); // {
		super.reset_phase(phase);

		phase.raise_objection(this);

		wait(vif.RSTN === 1'b0); // wait reset start
		m_driveAllX(); // drive all signal to this device to X value

		wait(vif.RSTN === 1'b1); // wait reset done
		m_driveAllDef(); // drive all output signal of this device to default value

		phase.drop_objection(this);

	endtask // }

	task main_phase (uvm_phase phase); // {
		forever begin // {
			// here is normal running phase
			seq_item_port.get_next_item(req);

			seq_item_port.item_done();
		end // }
	endtask // }


endclass // }



`endif
