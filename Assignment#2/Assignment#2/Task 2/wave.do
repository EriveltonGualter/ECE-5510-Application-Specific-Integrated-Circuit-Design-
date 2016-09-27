onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /counter_vhdl/CLR
add wave -noupdate /counter_vhdl/load
add wave -noupdate /counter_vhdl/A
add wave -noupdate /counter_vhdl/B
add wave -noupdate /counter_vhdl/C
add wave -noupdate /counter_vhdl/D
add wave -noupdate /counter_vhdl/CLK
add wave -noupdate /counter_vhdl/ENP
add wave -noupdate /counter_vhdl/ENT
add wave -noupdate /counter_vhdl/Qa
add wave -noupdate /counter_vhdl/Qb
add wave -noupdate /counter_vhdl/Qc
add wave -noupdate /counter_vhdl/Qd
add wave -noupdate /counter_vhdl/Rco
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {11 ns} 0}
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
WaveRestoreZoom {0 ns} {401 ns}
