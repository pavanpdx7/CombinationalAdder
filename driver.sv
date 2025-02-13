class adder_driver extends uvm_driver#(adder_seq_item);
  `uvm_component_utils(adder_driver)
  
  adder_seq_item item;
  virtual adder_intf vif;
  
  function new(string name="adder_driver", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    item=adder_seq_item::type_id::create("item");
    if(!uvm_config_db#(virtual adder_intf)::get(this,"","vif",vif))
      `uvm_fatal("DRIVER","Unable to fetch interface from top level module");
  endfunction
       
   virtual task run_phase(uvm_phase phase);
     super.run_phase(phase);
     forever begin
       seq_item_port.get_next_item(item);
       vif.a<=item.a;
       vif.b<=item.b;
       vif.y<=item.y;
       `uvm_info("DRIVER",$sformatf("Driving to DUT a=%0d b=%0d",item.a,item.b),UVM_MEDIUM);
       seq_item_port.item_done();
       #10;
     end
   endtask
endclass
