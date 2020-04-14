// ******************************************************************************************
// File         : ext_uvm_phase.svh
// Author       : RyanHunter
// Creating Date: Sat Apr 11 10:04:31 2020
// Claim        : only the author can comment without a signature preffixed by ', that
// means anyone else want to change the code must comments with '.
// ******************************************************************************************


`ifndef ext_uvm_phase__svh
`define ext_uvm_phase__svh

class my_component extends uvm_component; // {
	virtual function void post_build_phase (uvm_phase phase); endfunction

	function new (string name ="my_component", uvm_component parent = null); // {
		super.new(name,parent);
	endfunction // }

endclass // }

class my_test extends my_component; // {
	function new (string name ="my_test", uvm_component parent = null); // {
		super.new(name,parent);
	endfunction // }

	
endclass // }



class my_post_build_phase extends uvm_topdown_phase; // {
   virtual function void exec_func(uvm_component comp, uvm_phase phase);
   	my_component ncomp;
	// only execute post_build_phase for compatible components
	if ($cast(ncomp,comp)) 
		ncomp.post_build_phase(phase); 
   endfunction
   local static my_post_build_phase m_inst;
   static const string type_name = "my_post_build_phase";
   static function my_post_build_phase get();
      if(m_inst == null)
         m_inst = new();
      return m_inst; 
   endfunction
   protected function new(string name="post_build");
      super.new(name); 
   endfunction
   virtual function string get_type_name();
      return type_name;
   endfunction

endclass // }


`endif
