// Code your testbench here
// or browse Examples
//om
`timescale 1ns/1ps
import uvm_pkg::*;
`include "uvm_macros.svh"
`include "interface.sv"
`include "package.sv"
import adder_pkg::*;
module top;
  
  adder_intf intf();
  adder DUT(.y(intf.y),.a(intf.a),.b(intf.b));
  
initial begin
  $dumpfile("dump.vcd");
  $dumpvars();
end
  
initial begin
  uvm_config_db#(virtual adder_intf)::set(uvm_root::get(),"*","vif",intf);
  run_test("adder_test");
end
  
initial begin
  #500;  
  $finish;  
end
  
endmodule
