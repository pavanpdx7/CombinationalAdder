class adder_environment extends uvm_env;
  `uvm_component_utils(adder_environment)
  
  adder_scoreboard scb;
  adder_agent agnt;
  
  function new(string name="adder_environment", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    scb=adder_scoreboard::type_id::create("scb",this);
    agnt=adder_agent::type_id::create("agnt",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    agnt.mon.send.connect(scb.receive);
  endfunction
  
endclass
