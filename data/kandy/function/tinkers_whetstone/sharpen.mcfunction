# +1 attack damage for 20s, 60s cooldown
scoreboard players set @s tnk_still 0
scoreboard players set @s tnk_act 400
scoreboard players set @s tnk_cd 1200
attribute @s minecraft:attack_damage modifier remove kandy:tinker_edge
attribute @s minecraft:attack_damage modifier add kandy:tinker_edge 1 add_value
playsound minecraft:block.anvil.use player @a[distance=..12] ~ ~ ~ 0.6 1.5
particle minecraft:crit ~ ~1 ~ 0.4 0.4 0.4 0.3 25
particle minecraft:enchanted_hit ~ ~1 ~ 0.3 0.4 0.3 0.2 15
