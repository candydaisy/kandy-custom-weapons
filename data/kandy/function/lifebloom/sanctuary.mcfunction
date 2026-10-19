execute if score @s lb_scd matches 1.. run return run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.6 0.6
scoreboard players set @s lb_scd 600
summon minecraft:marker ~ ~ ~ {Tags:["kandy.lb_sanct","kandy.lb_new"]}
scoreboard players set @e[type=minecraft:marker,tag=kandy.lb_new] lb_life 120
tag @e[tag=kandy.lb_new] remove kandy.lb_new
playsound minecraft:block.beacon.activate player @a[distance=..16] ~ ~ ~ 1 1.6
