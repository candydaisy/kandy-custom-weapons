execute as @e[scores={bola_root=0..}] run function kandy:bola/release
kill @e[type=marker,tag=bola.tracker]
tag @e[type=snowball] remove bola.seen
tag @e[type=snowball] remove bola.proj
tag @e[type=ender_pearl] remove bola.pseen
scoreboard objectives remove bola_id
scoreboard objectives remove bola_life
scoreboard objectives remove bola_root
scoreboard objectives remove bola_imm
scoreboard objectives remove bola_lock
scoreboard objectives remove bola_tmp
data remove storage kandy:bola owner
data remove storage kandy:bola cmp
