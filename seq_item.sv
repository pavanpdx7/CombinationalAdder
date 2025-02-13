class adder_seq_item extends uvm_sequence_item;
  `uvm_object_utils(adder_seq_item)
  
  rand logic [3:0] a;
  rand logic [3:0] b;
  logic [4:0] y;
  
  function new(string name="adder_seq_item");
    super.new(name);
  endfunction
  
endclass
