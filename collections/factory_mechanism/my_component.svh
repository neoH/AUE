// ******************************************************************************************
// File         : my_component.svh
// Author       : RyanHunter
// Creating Date: Sat Apr 11 08:47:22 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef my_component__svh
`define my_component__svh

class my_component_registry #(type T = uvm_component, string Tname = "uvm_component")
	extends uvm_component_registry#(T,{Tname,"_obseleted"}); // {

	T new_comp;

	const static string sub_type_name = Tname;

	function new (string name = "my_component_registry"); endfunction

	virtual function uvm_component create_component (string name, uvm_component parent); // {
		new_comp = new(name,parent);
		return new_comp;
	endfunction // }

	function T get_component(); // {
		return new_comp;
	endfunction // }

	virtual function string get_type_name(); // {
		return sub_type_name;
	endfunction // }



endclass // }

class my_component extends uvm_component; // {

	typedef uvm_component_registry#(parent_component,"parent_component") orig_type;
	typedef my_component_registry#(parent_component,"parent_component_copy")  ovrd_type;

	parent_component pc;
	parent_component pc_copy;

	`uvm_component_utils_begin(my_component)
	`uvm_component_utils_end


	function new (string name = "my_component", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	function void test_00(); // {


		// step 1. override the uvm_component_registry#(parent_component,"parent_component") 
		orig_type rt = orig_type::get();
		ovrd_type vt = new();
		uvm_factory f = uvm_factory::get();
		f.set_type_override_by_type(rt,vt);

		// step 2. create pc component by uvm_component_registry
		pc = parent_component::type_id::create("pc",this);
		uvm_report_info(get_type_name(),$sformatf("current pc handle is: %0d",pc));

		pc_copy = vt.get_component();
		uvm_report_info(get_type_name(),$sformatf("current pc_copy handle is: %0d",pc_copy));





	endfunction // }

	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task reset_phase(uvm_phase phase);
	extern task main_phase(uvm_phase phase);

endclass // }


function void my_component::build_phase (uvm_phase phase); // {{{
	super.build_phase(phase);
endfunction // }}}


function void my_component::connect_phase (uvm_phase phase); // {{{
	super.connect_phase(phase);
endfunction // }}}


task my_component::reset_phase (uvm_phase phase); // {{{
	
endtask // }}}


task my_component::main_phase (uvm_phase phase); // {{{
	
endtask // }}}


`endif
