//
// Generated by Bluespec Compiler, version 2014.07.A (build 34078, 2014-07-30)
//
// On Mon Aug 31 14:58:13 EDT 2015
//
//
// Ports:
// Name                         I/O  size props
// CLK                            I     1 clock
// RST_N                          I     1 reset
//
// No combinational paths from inputs to outputs
//
//

`ifdef BSV_ASSIGNMENT_DELAY
`else
  `define BSV_ASSIGNMENT_DELAY
`endif

`ifdef BSV_POSITIVE_RESET
  `define BSV_RESET_VALUE 1'b1
  `define BSV_RESET_EDGE posedge
`else
  `define BSV_RESET_VALUE 1'b0
  `define BSV_RESET_EDGE negedge
`endif

module mkHelloWorldOnce(CLK,
			RST_N);
  input  CLK;
  input  RST_N;

  // register said
  reg said;
  wire said$D_IN, said$EN;

  // register said
  assign said$D_IN = 1'd1 ;
  assign said$EN = !said ;

  // handling of inlined registers

  always@(posedge CLK)
  begin
    if (RST_N == `BSV_RESET_VALUE)
      begin
        said <= `BSV_ASSIGNMENT_DELAY 1'd0;
      end
    else
      begin
        if (said$EN) said <= `BSV_ASSIGNMENT_DELAY said$D_IN;
      end
  end

  // synopsys translate_off
  `ifdef BSV_NO_INITIAL_BLOCKS
  `else // not BSV_NO_INITIAL_BLOCKS
  initial
  begin
    said = 1'h0;
  end
  `endif // BSV_NO_INITIAL_BLOCKS
  // synopsys translate_on

  // handling of system tasks

  // synopsys translate_off
  always@(negedge CLK)
  begin
    #0;
    if (RST_N != `BSV_RESET_VALUE) if (!said) $display("hello, world");
    if (RST_N != `BSV_RESET_VALUE) if (said) $finish(32'd1);
  end
  // synopsys translate_on
endmodule  // mkHelloWorldOnce
