restart

force CLK 0 0, 1 10ns -r 20ns

force A 0 
force B 0
force C 0
force D 0

run 15ns

force A 1
force B 1

run 25ns
force load 0

run 35ns

force A 0 
force B 0
force C 1
force D 1