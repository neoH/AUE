// ******************************************************************************************
// File         : ext_uvm_phase.svh
// Author       : RyanHunter
// Creating Date: Sat Apr 11 10:04:31 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef ext_uvm_phase__svh
`define ext_uvm_phase__svh

class ext_phase extends uvm_topdown_phase; // {
   virtual function void exec_func(uvm_component comp, uvm_phase phase);
      comp.build_phase(phase); 
   endfunction
   local static ext_phase m_inst;
   static const string type_name = "ext_phase";
   static function ext_phase get();
      if(m_inst == null)
         m_inst = new();
      return m_inst; 
   endfunction
   protected function new(string name="ext");
      super.new(name); 
   endfunction
   virtual function string get_type_name();
      return type_name;
   endfunction

endclass // }


class ext_uvm_phase extends uvm_component; // {

	uvm_phase up;

	`uvm_component_utils_begin(ext_uvm_phase)
	`uvm_component_utils_end


	function new (string name = "ext_uvm_phase", uvm_component parent = null);
		super.new(name,parent);
	endfunction

	task test_00(); // {
		up = new("up");
	endtask // }

	extern function void build_phase(uvm_phase phase);
	extern function void connect_phase(uvm_phase phase);
	extern task reset_phase(uvm_phase phase);
	extern task main_phase(uvm_phase phase);

endclass // }


function void ext_uvm_phase::build_phase (uvm_phase phase); // {{{
	super.build_phase(phase);
endfunction // }}}


function void ext_uvm_phase::connect_phase (uvm_phase phase); // {{{
	super.connect_phase(phase);
endfunction // }}}


task ext_uvm_phase::reset_phase (uvm_phase phase); // {{{
	
endtask // }}}


task ext_uvm_phase::main_phase (uvm_phase phase); // {{{
	
endtask // }}}


`endif
