// Code your design here
// randc will generate unique values 
// rand will generate values that is already been generated 
class generator;
  randc bit [3:0] a,b;
endclass

module tb;
  generator g;
  int i = 0;
  initial
    begin
      g = new();
      for(i=0;i<10;i++)
        begin
          // randomization using if statement
          if(!g.randomize())
            begin
              $display ("Randomization failed at time %0t", $time);
              $finish();
            end
          $display("a: %0d, b: %0d",g.a, g.b);
         
          #10;
        end
    end
endmodule
