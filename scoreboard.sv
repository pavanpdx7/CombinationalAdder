class adder_scoreboard extends uvm_scoreboard;
  `uvm_component_utils(adder_scoreboard)
  
  uvm_analysis_imp#(adder_seq_item,adder_scoreboard) receive;
  adder_seq_item req;
  
  function new(string name="adder_scoreboard", uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    receive=new("receive",this);
    req=adder_seq_item::type_id::create("req");
  endfunction
  
  function void write(adder_seq_item tr);
    req=tr;
    `uvm_info("SCOREBOARD",$sformatf("---RECEIVED DATA FROM MONITOR TO SCOREBOARD---a=%0d b=%0d",req.a,req.b), UVM_MEDIUM);
    if(req.y==req.a+req.b) begin
      `uvm_info("SCOREBOARD",$sformatf("---MATCHED---a=%0d b=%0d actual_y=%0d expected_y=%0d",req.a,req.b,req.y,req.a+req.b), UVM_MEDIUM);
      `uvm_info("SEQUENCE",$sformatf("________________________________________________________________________________"), UVM_MEDIUM);
    end
      else begin
      `uvm_info("SCOREBOARD",$sformatf("***MISMATCHED***a=%0d b=%0d actual_y=%0d expected_y=%0d",req.a,req.b,req.y,req.a+req.b), UVM_MEDIUM);
      end
  endfunction
endclass    
