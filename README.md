You can execute our code by making sure you are in the do folder and putting into command prompt: vsim -do fsm.do and vsim -do regfile.do

Overall. we mostly implemented the fsm machine as it was given to us and the real challenge was getting the test bench to work. We basically 
put in values for in and observed the reset, in and out in modelsim and the waveforms looked in congruence with the lab document graphic. 
We made minor changes to the do file to run the appropriate files.

When it comes to the regfile, we created a register by putting the 0 address of the read to 0 and for all other addresses, we input some data. 
That part was combinational, but we also used sequencial logic. When the clock edge was high and the writing address wasn't 0, we would write data
to that part in memory. To test our design, we made a test bench that would have various read and write addresses to write in the hexidecial "hbeebeeaf".
We made sure to follow the following test guidelines: 
// Test 1: Write to register 1 and read it back
// Test 2: Write to register 2 and read both registers
// Test 3: Try to write to register 0 (should remain 0)
// Test 4: Concurrent read/write to same register
// Test 5: Write disabled

Our biggest issue was timing, we chose not to implement a positive edge logic in our test bench and instead hardcoded each address name and write in 
value after a delay of a certain number of seconds, because our math was wrong the write tests didn't correspond to the positive clock edge and we 
weren't writing in our data. After we fixed it the test bench worked fine. 
