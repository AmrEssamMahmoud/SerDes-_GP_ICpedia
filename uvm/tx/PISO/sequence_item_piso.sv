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
        //*******************************//
        // TODO: Define Covergroups Here //
        //*******************************//

    endclass
endpackage
