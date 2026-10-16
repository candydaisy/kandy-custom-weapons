# Absorption II gives 4 hearts; a negative max_absorption modifier caps it at 1 heart per soul
scoreboard players set @s rpr_t 600
attribute @s minecraft:max_absorption modifier remove kandy:reapers_cap
execute if score @s rpr_s matches 1 run attribute @s minecraft:max_absorption modifier add kandy:reapers_cap -6 add_value
execute if score @s rpr_s matches 2 run attribute @s minecraft:max_absorption modifier add kandy:reapers_cap -4 add_value
execute if score @s rpr_s matches 3 run attribute @s minecraft:max_absorption modifier add kandy:reapers_cap -2 add_value
effect give @s minecraft:absorption 30 1 true
particle minecraft:soul ~ ~1 ~ 0.4 0.6 0.4 0.03 12
particle minecraft:sculk_soul ~ ~1.2 ~ 0.3 0.4 0.3 0.02 4
playsound minecraft:particle.soul_escape player @s ~ ~ ~ 1 0.9
