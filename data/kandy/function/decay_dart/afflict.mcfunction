# Run as a struck entity: 4s of Necrosis (refreshes, doesn't stack). Snapshot health so only later gains are undone
scoreboard players set @s dart_nec 80
execute store result score @s dart_last run data get entity @s Health 10
particle minecraft:witch ~ ~1.2 ~ 0.3 0.4 0.3 0.02 10
playsound minecraft:entity.zombie_villager.cure player @a[distance=..16] ~ ~ ~ 0.3 2
