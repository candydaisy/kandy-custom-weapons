tag @s remove kandy.way_arrived
execute unless entity @s[gamemode=creative] run experience add @s -5 levels
scoreboard players set @s way_cd 12000
execute at @s run particle minecraft:portal ~ ~1 ~ 0.5 0.8 0.5 0.4 60
execute at @s run playsound minecraft:block.respawn_anchor.set_spawn player @a[distance=..16] ~ ~ ~ 1 1.2
