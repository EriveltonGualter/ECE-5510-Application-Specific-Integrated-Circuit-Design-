########################################
#      Macro for parity generator      #
########################################

restart

# Test the wave for the input 0000000
# The answer should be 00000000
force A 0

# Test the wave for the input 0000001
# The answer should be 00000011
run 10ns
force A 2'h1

# Test the wave for the input 0110011
# The answer should be 01100110
run 10ns
force A 2'h33
run 10ns

# Test the wave for the input 0010100
# The answer should be 00101000
force A 2'h14
run 10ns

# Test the wave for the input 0111000
# The answer should be 01110001
force A 2'h38
run 10ns

# Test the wave for the input 1000100
# The answer should be 10001000
force A 2'h44
run 10ns

# Test the wave for the input 0000001
# The answer should be 00000011
force A 2'h1
run 10ns

# Test the wave for the input 1111000
# The answer should be 11110000
force A 2'h78
run 10ns

