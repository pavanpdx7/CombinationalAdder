class adder_agent extends uvm_agent;
  `uvm_component_utils(adder_agent)
  
adder_sequencer seqr;
adder_driver drvr;
adder_monitor mon;
  
  function new(string name="adder_agent", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    seqr=adder_sequencer::type_id::create("seqr",this);
    drvr=adder_driver::type_id::create("drvr",this);
    mon=adder_monitor::type_id::create("mon",this);
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drvr.seq_item_port.connect(seqr.seq_item_export);
  endfunction
endclass
