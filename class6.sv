// external funtion and constraint

class generator ;
  randc bit [3:0] a, b;
  extern constraint data;
  extern function void display ();
endclass
    
    constraint generator :: data {a inside {[0:8]}; b inside {[8:15]};}
    
    function void generator :: display ();
      $display("a: %0d, b: %0d",a, b);
    endfunction

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
          g.display();
         
          #10;
        end
    end
endmodule
