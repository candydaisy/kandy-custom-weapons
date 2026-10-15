# Totem popped while under Necrosis: swap its Absorption II / Regeneration II for Absorption I / Regeneration I (10s)
effect clear @s minecraft:absorption
effect clear @s minecraft:regeneration
effect give @s minecraft:absorption 5 0
effect give @s minecraft:regeneration 10 0
execute store result score @s dart_last run data get entity @s Health 10
particle minecraft:totem_of_undying ~ ~1 ~ 0.3 0.5 0.3 0.1 10
playsound minecraft:entity.wither.ambient player @a[distance=..16] ~ ~ ~ 0.4 1.6
