onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /bcd_vhdl/CLK
add wave -noupdate /bcd_vhdl/CLK_mod
add wave -noupdate /bcd_vhdl/CLR
add wave -noupdate /bcd_vhdl/AN
add wave -noupdate /bcd_vhdl/C
add wave -noupdate /bcd_vhdl/unit
add wave -noupdate /bcd_vhdl/dozen
add wave -noupdate /bcd_vhdl/bcd
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {170 ns} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
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
WaveRestoreZoom {0 ns} {190 ns}
