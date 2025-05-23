class mc_seq extends uvm_sequence;
    
    `uvm_object_utils(mc_seq)
  
   //declare the multichannel_sequencer
    `uvm_declare_p_sequencer(mc_sequencer)


    function new(string name ="mc_seq");
        super.new(name);
    endfunction:new

task pre_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      // in UVM1.2, get starting phase from method
      phase = get_starting_phase();
    `else
      phase = starting_phase;
    `endif
    if (phase != null) begin
      phase.raise_objection(this, get_type_name());
      `uvm_info(get_type_name(), "raise objection", UVM_MEDIUM)
    end
  endtask : pre_body

  task post_body();
    uvm_phase phase;
    `ifdef UVM_VERSION_1_2
      // in UVM1.2, get starting phase from method
      phase = get_starting_phase();
    `else
      phase = starting_phase;
    `endif
    if (phase != null) begin
      phase.drop_objection(this, get_type_name());
      `uvm_info(get_type_name(), "drop objection", UVM_MEDIUM)
    end
  endtask : post_body



endclass: mc_seq



class en_spi_seq extends mc_seq;
    
    `uvm_object_utils(en_spi_seq)
 

    function new(string name ="en_spi_seq");
        super.new(name);
    endfunction:new


  // declare the sequences to run

  enable_spi_core en_spi;



virtual task body;
`uvm_info(get_type_name(), "body of mc_sequence 🧑🏻‍⚖️" , UVM_FULL)
fork
`uvm_do_on(en_spi, p_sequencer.wb_seqr)

join

endtask:body


endclass: en_spi_seq





class write_wbxspi_seq extends mc_seq;
    
    `uvm_object_utils(write_wbxspi_seq)
 

    function new(string name ="write_wbxspi_seq");
        super.new(name);
    endfunction:new


  // declare the sequences to run

  wb_write_spi1_seq wb_spi1_write;
  spi_slave_response_seq spi_seq;


virtual task body;
`uvm_info(get_type_name(), "body of mc_sequence 🧑🏻‍⚖️" , UVM_FULL)
fork
`uvm_do_on(wb_spi1_write, p_sequencer.wb_seqr)
`uvm_do_on(spi_seq, p_sequencer.spi1_seqr)
join

endtask:body


endclass: write_wbxspi_seq



class read_wbxspi_seq extends mc_seq;
    
    `uvm_object_utils(read_wbxspi_seq)
 

    function new(string name ="read_wbxspi_seq");
        super.new(name);
    endfunction:new

//declare the sequences you want to use
wb_read_spi1_seq wb_spi1_read;
spi_slave_response_seq spi_seq;

virtual task body;
`uvm_info(get_type_name(), "body of mc_sequence 🧑🏻‍⚖️" , UVM_FULL)
fork
`uvm_do_on(wb_spi1_read, p_sequencer.wb_seqr)
`uvm_do_on(spi_seq, p_sequencer.spi1_seqr)
join

endtask:body


endclass: read_wbxspi_seq

class flag_wbxspi_seq extends mc_seq;
    
    `uvm_object_utils(flag_wbxspi_seq)
 

    function new(string name ="flag_wbxspi_seq");
        super.new(name);
    endfunction:new

//declare the sequences you want to use
wb_flags_spi1_seq wb_spi1_flag;
spi_slave_response_seq spi_seq;

virtual task body;
`uvm_info(get_type_name(), "body of mc_sequence 🧑🏻‍⚖️" , UVM_FULL)
fork
`uvm_do_on(wb_spi1_flag, p_sequencer.wb_seqr)
`uvm_do_on(spi_seq, p_sequencer.spi1_seqr)
join

endtask:body


endclass: flag_wbxspi_seq

class stress_wbxspi_seq extends mc_seq;
    
    `uvm_object_utils(stress_wbxspi_seq)
 

    function new(string name ="stress_wbxspi_seq");
        super.new(name);
    endfunction:new


  // declare the sequences to run
  wb_read_spi1_seq wb_spi1_read;
  // wb_read_spi2_seq wb_spi2_read;
  wb_write_spi1_seq wb_spi1_write;
  // wb_write_spi2_seq wb_spi2_write;
  spi_slave_response_seq spi_seq;


virtual task body;
`uvm_info(get_type_name(), "body of mc_sequence 🧑🏻‍⚖️" , UVM_FULL)
fork
`uvm_do_on(wb_spi1_write, p_sequencer.wb_seqr)
`uvm_do_on(spi_seq, p_sequencer.spi1_seqr)
// `uvm_do_on(wb_spi2_write, p_sequencer.wb_seqr)
// `uvm_do_on(spi_seq, p_sequencer.spi1_seqr)
`uvm_do_on(wb_spi1_write, p_sequencer.wb_seqr)
`uvm_do_on(spi_seq, p_sequencer.spi1_seqr)
`uvm_do_on(wb_spi1_write, p_sequencer.wb_seqr)
`uvm_do_on(spi_seq, p_sequencer.spi1_seqr)
`uvm_do_on(wb_spi1_write, p_sequencer.wb_seqr)
`uvm_do_on(spi_seq, p_sequencer.spi1_seqr)
`uvm_do_on(wb_spi1_write, p_sequencer.wb_seqr)
`uvm_do_on(spi_seq, p_sequencer.spi1_seqr)
`uvm_do_on(wb_spi1_read, p_sequencer.wb_seqr)
`uvm_do_on(spi_seq, p_sequencer.spi1_seqr)
join

endtask:body


endclass: stress_wbxspi_seq
