########################################
#        Macro for the SN7ALS163       #
########################################

restart

# Generates de clock with T = 20ns
force CLK 0 0, 1 10ns -r 20ns

# Initial Information
force A 0
force B 0
force C 0
force D 0
force ENP 0
force ENT 0
force load 1
force CLR 1

# Initial condition for A, B, C, D
run 10ns
force A 1
force B 1
force C 0
force D 0

# Clear test
run 7ns
force CLR 0
run 15ns
force CLR 1

# Load of the initial condition
run 10ns
force load 0
run 10ns
force load 1

# Test of the inputs ENP and ENT
run 10ns
force ENP 1
run 15ns
force ENT 1

# Maintain the count working
run 150ns

# Test the Inhibit
force ENP 0
run 15ns
force ENP 1

run 170ns


