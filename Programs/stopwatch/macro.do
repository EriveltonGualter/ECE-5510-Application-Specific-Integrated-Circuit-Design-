restart

force CLK 0 0, 1 10ns -r 20ns

force PB0 0
force SW1 1

#force SW1 0 @120ns

#force SW1 1 @175ns

#force PB0 1 @300ns
#force PB0 0 @400ns

run 1000ns
