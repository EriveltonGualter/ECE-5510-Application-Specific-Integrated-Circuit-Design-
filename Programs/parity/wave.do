onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand /parity_vhdl/A
add wave -noupdate -color {Medium Blue} -expand -subitemconfig {/parity_vhdl/p(7) {-color {Medium Blue}} /parity_vhdl/p(6) {-color {Medium Blue}} /parity_vhdl/p(5) {-color {Medium Blue}} /parity_vhdl/p(4) {-color {Medium Blue}} /parity_vhdl/p(3) {-color {Medium Blue}} /parity_vhdl/p(2) {-color {Medium Blue}} /parity_vhdl/p(1) {-color {Medium Blue}} /parity_vhdl/p(0) {-color {Medium Blue}}} /parity_vhdl/p
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {16 ns} 0}
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
WaveRestoreZoom {0 ns} {84 ns}
