class base_test extends uvm_test;

  `uvm_component_utils(base_test)

  testbench tb;

  function new(string name = "base_test", uvm_component parent = null);
    super.new(name, parent);
  endfunction : new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    // Enable transaction recording for everything
    uvm_config_int::set(this, "*", "recording_detail", UVM_FULL);
    // Create the tb
    tb = testbench::type_id::create("tb", this);
  endfunction : build_phase

  function void end_of_elaboration_phase(uvm_phase phase);
    uvm_top.print_topology();
  endfunction

  function void check_phase(uvm_phase phase);
    check_config_usage();
  endfunction

endclass : base_test




//----------------------------------------------------------------
// TEST: write test 
//----------------------------------------------------------------
class wbxspi_write_test extends base_test;

  `uvm_component_utils(wbxspi_write_test)

  function new(string name = get_type_name(), uvm_component parent = null);
    super.new(name, parent);
  endfunction : new




  task run_phase(uvm_phase phase);
    uvm_objection obj = phase.get_objection();
    obj.set_drain_time(this, 100ns);
  endtask : run_phase


  virtual function void build_phase(uvm_phase phase);


    // Set the default sequence for the clock
    uvm_config_wrapper::set(this, "*mc_seqr.run_phase",  "default_sequence", write_wbxspi_seq::get_type()); 
    uvm_config_wrapper::set(this, "*clk_rst*", "default_sequence", clk10_rst5_seq::get_type());




  



    super.build_phase(phase);
  endfunction : build_phase

endclass : wbxspi_write_test



//----------------------------------------------------------------
// TEST: read  test
//----------------------------------------------------------------
class wbxspi_read_test extends base_test;

  `uvm_component_utils(wbxspi_read_test)

  function new(string name = get_type_name(), uvm_component parent = null);
    super.new(name, parent);
  endfunction : new




  task run_phase(uvm_phase phase);
    uvm_objection obj = phase.get_objection();
    obj.set_drain_time(this, 100ns);
  endtask : run_phase


 virtual function void build_phase(uvm_phase phase);


    // Set the default sequence for the clock
    uvm_config_wrapper::set(this, "*mc_seqr.run_phase",  "default_sequence", read_wbxspi_seq::get_type()); 
    uvm_config_wrapper::set(this, "*clk_rst*", "default_sequence", clk10_rst5_seq::get_type());


    super.build_phase(phase);
  endfunction : build_phase
endclass : wbxspi_read_test

class wbxspi_flags_test extends base_test;

  `uvm_component_utils(wbxspi_flags_test)

  function new(string name = get_type_name(), uvm_component parent = null);
    super.new(name, parent);
  endfunction : new




  task run_phase(uvm_phase phase);
    uvm_objection obj = phase.get_objection();
    obj.set_drain_time(this, 100ns);
  endtask : run_phase


 virtual function void build_phase(uvm_phase phase);


    // Set the default sequence for the clock
    uvm_config_wrapper::set(this, "*mc_seqr.run_phase",  "default_sequence", flag_wbxspi_seq ::get_type()); 
    uvm_config_wrapper::set(this, "*clk_rst*", "default_sequence", clk10_rst5_seq::get_type());


    super.build_phase(phase);
  endfunction : build_phase
endclass : wbxspi_flags_test

class wbxspi_stress_test extends base_test;

  `uvm_component_utils(wbxspi_stress_test)

  function new(string name = get_type_name(), uvm_component parent = null);
    super.new(name, parent);
  endfunction : new




  task run_phase(uvm_phase phase);
    uvm_objection obj = phase.get_objection();
    obj.set_drain_time(this, 100ns);
  endtask : run_phase


 virtual function void build_phase(uvm_phase phase);


    // Set the default sequence for the clock
    uvm_config_wrapper::set(this, "*mc_seqr.run_phase",  "default_sequence", stress_wbxspi_seq ::get_type()); 
    uvm_config_wrapper::set(this, "*clk_rst*", "default_sequence", clk10_rst5_seq::get_type());


    super.build_phase(phase);
  endfunction : build_phase
endclass : wbxspi_stress_test




