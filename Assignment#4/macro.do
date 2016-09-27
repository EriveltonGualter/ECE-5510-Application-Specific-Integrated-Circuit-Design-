restart

force CLK 0 0, 1 10ns -r 20ns

force PB0 0
force SW1 1

force SW1 0 @5000ns
force SW1 1 @7000ns

force PB0 1 @14000ns
force PB0 0 @17000ns


run 25000ns
