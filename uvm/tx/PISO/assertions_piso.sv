module assertions_piso (piso_if.DUT _if);
    
    //*****************************//
    // TODO: Write Assertions Here //
    //*****************************//
    property reset;
	@(posedge _if.clk) (!_if.rst_n) |=> (_if.serial_out==0) ;
    endproperty

    wr_ack_a:assert property (reset);
    wr_ack_c:cover property (reset);
endmodule
