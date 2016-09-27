onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /stopwatch/CLK
add wave -noupdate /stopwatch/SMCLK
add wave -noupdate /stopwatch/DBCLK
add wave -noupdate /stopwatch/SGCLK
add wave -noupdate /stopwatch/SW1
add wave -noupdate /stopwatch/DSW1
add wave -noupdate /stopwatch/PB0
add wave -noupdate /stopwatch/DPB0
add wave -noupdate /stopwatch/AN
add wave -noupdate /stopwatch/SEG
add wave -noupdate -itemcolor Cyan /stopwatch/DIG4
add wave -noupdate -itemcolor Cyan /stopwatch/DIG3
add wave -noupdate -itemcolor Cyan /stopwatch/DIG2
add wave -noupdate -itemcolor Cyan /stopwatch/DIG1
add wave -noupdate /stopwatch/SHIFTR1
add wave -noupdate /stopwatch/SHIFTR2
add wave -noupdate /stopwatch/BCD
add wave -noupdate /stopwatch/PRESENT_STATE
add wave -noupdate /stopwatch/STOP_COUNT
add wave -noupdate /stopwatch/DISPLAY_FREEZE
add wave -noupdate /stopwatch/RESET_COUNT
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {190 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 198
configure wave -valuecolwidth 54
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
WaveRestoreZoom {0 ns} {821 ns}
