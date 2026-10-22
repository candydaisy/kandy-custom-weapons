# Run as the creature that receives a dead creature's echoes
scoreboard players operation @s echo_stacks += #stacks soul_pid
scoreboard players operation @s echo_tier = #tier soul_pid
function kandy:sin/gluttony/weapon/cap
scoreboard players operation @s echo_owner = #owner soul_pid
execute unless score @s echo_timer matches 1.. run scoreboard players set @s echo_timer 20
execute at @s run particle minecraft:soul ~ ~1 ~ 0.3 0.5 0.3 0.05 12
execute at @s run playsound minecraft:particle.soul_escape player @a[distance=..16] ~ ~ ~ 1 0.8
