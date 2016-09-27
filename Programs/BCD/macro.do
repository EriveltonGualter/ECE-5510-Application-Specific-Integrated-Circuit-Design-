
restart

force CLK 0 0, 1 10ns -r 20ns
force CLR 0

run 155ns
force CLR 1 
run 155ns
force CLR 0

run 3000ns