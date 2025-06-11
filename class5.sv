// Code your design here
// randc will generate unique values 
// rand will generate values that is already been generated 
class generator;
  randc bit [3:0] a,b;
  //adding constraint
  //constraint data {a<7; a>0; b>0;}
  
  // working with ranges 
  constraint data {!a inside {[0:4]}; b inside {[8:15]};}
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
          /*if(!g.randomize())
            begin
              $display ("Randomization failed at time %0t", $time);
              $finish();
            end */
          
          // randomization using assert method
          assert(g.randomize ())
            else 
              begin
                $display ("Randomization failed at time %0t", $time);
              	$finish();
              end
          $display("a: %0d, b: %0d",g.a, g.b);
         
          #10;
        end
    end
endmodule
