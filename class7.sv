class generator;

  randc bit [3:0] a, b;
  bit [3:0] y;

  int min;
  int max;

  function void set_range(input int min, input int max);
    this.min = min;
    this.max = max;
  endfunction

  constraint data {
    a inside {[min:max]};
    b inside {[min:max]};
  }

  function void post_randomize();
    $display("Value of a: %0d and b: %0d", a, b);
  endfunction

endclass

module tb;

  int i = 0;
  generator g;

  initial begin
    g = new();

    for (i = 0; i < 10; i++) begin
      g.set_range(3, 8);           // renamed from pre_randomize
      void'(g.randomize());        // correct function call
      #10;
    end
  end

endmodule
