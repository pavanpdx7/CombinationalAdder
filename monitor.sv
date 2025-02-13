class adder_monitor extends uvm_monitor;
  `uvm_component_utils(adder_monitor)
  
  uvm_analysis_port#(adder_seq_item) send;
  virtual adder_intf vif;
  adder_seq_item item;
  
  function new(string name="adder_monitor", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    send=new("send",this);
    item=adder_seq_item::type_id::create("item");
    if(!uvm_config_db#(virtual adder_intf)::get(this,"","vif",vif))
      `uvm_fatal("MONITOR","Unable to fetch the interface from top level module");
  endfunction
  
  virtual task run_phase(uvm_phase phase);
    super.run_phase(phase);
    repeat(30) begin
      #15;
    	item.a=vif.a;
      	item.b=vif.b;
      	item.y=vif.y;
      `uvm_info("MONITOR",$sformatf("Sending stimulus to Scoreboard a=%0d b=%0d",item.a,item.b), UVM_MEDIUM);
      send.write(item);
      end
  endtask
endclass
