onerror {resume}
quietly virtual signal -install /blackjack { (context /blackjack )(CSTATE_FSM_FFd5_4309 & CSTATE_FSM_FFd4_4307 & CSTATE_FSM_FFd3_4332 & CSTATE_FSM_FFd2_4306 )} STATE
quietly virtual signal -install /blackjack { (context /blackjack )(CSTATE_FSM_FFd1_4331 & CSTATE_FSM_FFd2_4306 & CSTATE_FSM_FFd3_4332 & CSTATE_FSM_FFd4_4307 & CSTATE_FSM_FFd5_4309 )} STATE001
quietly virtual signal -install /blackjack { (context /blackjack )(GAMEDECK_12 &GAMEDECK_11 &GAMEDECK_10 &GAMEDECK_9 &GAMEDECK_8 &GAMEDECK_7 &GAMEDECK_6 &GAMEDECK_5 &GAMEDECK_4 &GAMEDECK_3 &GAMEDECK_2 &GAMEDECK_1 &GAMEDECK_0 )} GAMEDECK
quietly WaveActivateNextPane {} 0
add wave -noupdate /blackjack/CLK
add wave -noupdate /blackjack/SMCLK_BUFG_4315
add wave -noupdate /blackjack/RESET
add wave -noupdate /blackjack/DEALPB
add wave -noupdate /blackjack/STAND
add wave -noupdate /blackjack/HIT
add wave -noupdate /blackjack/DISP
add wave -noupdate /blackjack/SEG
add wave -noupdate /blackjack/AN
add wave -noupdate /blackjack/RES
add wave -noupdate /blackjack/PLED
add wave -noupdate /blackjack/DLED
add wave -noupdate /blackjack/STATE001
add wave -noupdate /blackjack/CSTATE_FSM_FFd1_4331
add wave -noupdate /blackjack/CSTATE_FSM_FFd2_4306
add wave -noupdate /blackjack/CSTATE_FSM_FFd3_4332
add wave -noupdate /blackjack/CSTATE_FSM_FFd4_4307
add wave -noupdate /blackjack/CSTATE_FSM_FFd5_4309
add wave -noupdate -radix unsigned /blackjack/PLAYERCARDS_0
add wave -noupdate -radix unsigned /blackjack/PLAYERCARDS_1
add wave -noupdate -radix unsigned /blackjack/PLAYERCARDS_2
add wave -noupdate -radix unsigned /blackjack/PLAYERCARDS_3
add wave -noupdate -radix unsigned /blackjack/PLAYERCARDS_4
add wave -noupdate -radix unsigned /blackjack/DEALERCARDS_0
add wave -noupdate -radix unsigned /blackjack/DEALERCARDS_1
add wave -noupdate -radix unsigned /blackjack/DEALERCARDS_3
add wave -noupdate -radix unsigned /blackjack/DEALERCARDS_2
add wave -noupdate -radix unsigned /blackjack/DEALERCARDS_4
add wave -noupdate -radix unsigned /blackjack/PSCORE
add wave -noupdate -radix unsigned /blackjack/DSCORE
add wave -noupdate -radix unsigned /blackjack/DTOTAL
add wave -noupdate -radix unsigned /blackjack/PTOTAL
add wave -noupdate -radix unsigned /blackjack/GAMEDECK_0
add wave -noupdate -radix unsigned /blackjack/GAMEDECK_1
add wave -noupdate -radix unsigned /blackjack/GAMEDECK_2
add wave -noupdate -radix unsigned /blackjack/GAMEDECK_3
add wave -noupdate -radix unsigned /blackjack/GAMEDECK_4
add wave -noupdate -radix unsigned /blackjack/GAMEDECK_5
add wave -noupdate -radix unsigned /blackjack/GAMEDECK_6
add wave -noupdate -radix unsigned /blackjack/GAMEDECK_7
add wave -noupdate -radix unsigned /blackjack/GAMEDECK_8
add wave -noupdate -radix unsigned /blackjack/GAMEDECK_9
add wave -noupdate -radix unsigned /blackjack/GAMEDECK_10
add wave -noupdate -radix unsigned /blackjack/GAMEDECK_11
add wave -noupdate -radix unsigned -childformat {{/blackjack/GAMEDECK_12(2) -radix unsigned} {/blackjack/GAMEDECK_12(1) -radix unsigned} {/blackjack/GAMEDECK_12(0) -radix unsigned}} -subitemconfig {/blackjack/GAMEDECK_12(2) {-radix unsigned} /blackjack/GAMEDECK_12(1) {-radix unsigned} /blackjack/GAMEDECK_12(0) {-radix unsigned}} /blackjack/GAMEDECK_12
add wave -noupdate -radix unsigned /blackjack/rand_temp
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {192471 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 282
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
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {1050 ns}
