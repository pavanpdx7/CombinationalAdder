class adder_test extends uvm_test;
  `uvm_component_utils(adder_test)
  
  adder_environment e;
  adder_sequence seq;
  
  function new(string name="adder_test", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e=adder_environment::type_id::create("e",this);
    seq=adder_sequence::type_id::create("seq",this);
  endfunction
  
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    phase.raise_objection(this);
    seq.start(e.agnt.seqr);
    #1000;
    phase.drop_objection(this);
  endtask
endclass
