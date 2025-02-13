class adder_sequence extends uvm_sequence#(adder_seq_item);
  `uvm_object_utils(adder_sequence)
  
adder_seq_item req;  
  
  function new(string name="adder_sequence");
    super.new(name);
  endfunction

  virtual task body();
    req=adder_seq_item::type_id::create("req");
      repeat(30) begin
        start_item(req);
        assert(req.randomize());
        `uvm_info("SEQUENCE",$sformatf("________________________________________________________________________________"), UVM_MEDIUM);
        `uvm_info("SEQUENCE",$sformatf("Data sent to the Driver from Sequence a=%0d b=%0d",req.a,req.b), UVM_MEDIUM);
        finish_item(req);
        #15;
      end
  endtask
  
endclass
