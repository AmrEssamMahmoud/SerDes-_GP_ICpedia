package sequence_item_piso;
    import uvm_pkg::*;
    `include "uvm_macros.svh"
    import enums::*;
    
    class sequence_item_piso extends uvm_sequence_item ;
        `uvm_object_utils (sequence_item_piso)

        rand bit [9:0] parallel_in;
        bit [9:0] serial_out;

        function new (string name = "sequence_item_piso");
            super.new(name);
        endfunction : new

        //*******************************//
        // TODO: Define Constraints Here //
        //*******************************//
        constraint Assert_reset_less_often {
                    Reset dist {1:=98 ,0:=2};
        } 
        constraint random_bit_patterns {
            parallel_in dist {
            10'b0000000000 :/ 10, 
            10'b1111111111 :/ 10,  
            10'b1010101010 :/ 10,  
            10'b0101010101 :/ 10,  
            [10'b0000000001 : 10'b1111111110] :/ 60
       };
}
        //*******************************//
        // TODO: Define Covergroups Here //
        //*******************************//

    endclass
endpackage
