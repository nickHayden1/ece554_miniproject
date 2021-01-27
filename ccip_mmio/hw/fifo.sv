// fifo.sv
// Implements delay buffer (fifo)
// On reset all entries are set to 0
// Shift causes fifo to shift out oldest entry to q, shift in d

module fifo
  #(
  parameter DEPTH=8,
  parameter BITS=64
  )
  (
  input clk,rst_n,en,
  input [BITS-1:0] d,
  output reg [BITS-1:0] q
  );
  // your RTL code here
  reg [BITS-1:0] arr[DEPTH-1:0];
  integer i=0;
  integer ptr = 0;
  always@(posedge clk, negedge rst_n) begin
    if(~rst_n)begin
      for(i=0; i<DEPTH; i++)begin
        arr[i]<=64'd0;
      end
      q<=arr[0];
    end else if(en) begin
      q <= arr[ptr];
      arr[ptr]<=d;
      ptr<= (ptr +1)%8;
    end
  end
endmodule // fifo
