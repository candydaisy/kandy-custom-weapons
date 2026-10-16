# +1 max heart (2 max health) per soul, filled straight away with a short Regeneration; lasts 45s
scoreboard players set @s rpr_t 900
attribute @s minecraft:max_absorption modifier remove kandy:reapers_cap
attribute @s minecraft:max_health modifier remove kandy:reapers_soul
execute if score @s rpr_s matches 1 run attribute @s minecraft:max_health modifier add kandy:reapers_soul 2 add_value
execute if score @s rpr_s matches 2 run attribute @s minecraft:max_health modifier add kandy:reapers_soul 4 add_value
execute if score @s rpr_s matches 3 run attribute @s minecraft:max_health modifier add kandy:reapers_soul 6 add_value
execute if score @s rpr_s matches 4.. run attribute @s minecraft:max_health modifier add kandy:reapers_soul 8 add_value
effect give @s minecraft:regeneration 3 1 true
particle minecraft:soul ~ ~1 ~ 0.4 0.6 0.4 0.03 12
particle minecraft:sculk_soul ~ ~1.2 ~ 0.3 0.4 0.3 0.02 4
playsound minecraft:particle.soul_escape player @s ~ ~ ~ 1 0.9
