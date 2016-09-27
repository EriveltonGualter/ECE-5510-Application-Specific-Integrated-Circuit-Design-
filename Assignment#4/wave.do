onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group Clock /stopwatch/CLK
add wave -noupdate -expand -group Clock /stopwatch/CCLK
add wave -noupdate -expand -group Clock /stopwatch/MCLK
add wave -noupdate -expand -group Inputs /stopwatch/SW1
add wave -noupdate -expand -group Inputs /stopwatch/DSW1
add wave -noupdate -expand -group Inputs /stopwatch/PB0
add wave -noupdate -expand -group Inputs /stopwatch/DPB0
add wave -noupdate -expand -group Outputs /stopwatch/DP
add wave -noupdate -expand -group Outputs /stopwatch/AN
add wave -noupdate -expand -group Outputs /stopwatch/SEG
add wave -noupdate /stopwatch/COUNTING
add wave -noupdate -expand -group Watch /stopwatch/DIG4
add wave -noupdate -expand -group Watch /stopwatch/DIG3
add wave -noupdate -expand -group Watch /stopwatch/DIG2
add wave -noupdate -expand -group Watch /stopwatch/DIG1
add wave -noupdate -expand -group Watch /stopwatch/BCD
add wave -noupdate -expand -group {Machine State} /stopwatch/DISPLAY_FREEZE
add wave -noupdate -expand -group {Machine State} /stopwatch/PRESENT_STATE
add wave -noupdate -expand -group {Machine State} /stopwatch/RESET_COUNT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
configure wave -namecolwidth 197
configure wave -valuecolwidth 62
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ns} {1502 ns}
