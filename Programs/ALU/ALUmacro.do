
restart

force OPC 2'h0
force A 2'h0
force B 2'h1
force Cin 0
run 10ns

force OPC 2'h1
run 10ns

force A 2'h2
run 10ns

force A 2'h3
run 10ns

force A 2'h4
run 10ns

force A 2'h5
run 10ns

force A 2'h6
run 10ns

force A 2'h7
force OPC 2'h3
run 10ns
