# Run as a player whose Dive hit nothing: Pride comes before a fall
execute store result score #fall dg_tmp run data get entity @s Pos[1] 10
scoreboard players operation #fall dg_tmp -= @s dg_y
scoreboard players operation #fall dg_tmp /= #-10 dg_tmp
scoreboard players remove #fall dg_tmp 3
execute if score #fall dg_tmp matches ..0 run return 0
execute if score @s dg_tier matches 3 run scoreboard players operation #fall dg_tmp += #fall dg_tmp
execute store result storage kandy:sin fall.amt int 1 run scoreboard players get #fall dg_tmp
function kandy:sin/pride/weapon/fall_damage with storage kandy:sin fall
title @s actionbar {text:"Pride comes before a fall.",color:"#9b59ff",italic:true}
