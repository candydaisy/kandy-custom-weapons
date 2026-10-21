# Run as a player robbed by kandy.cw_thief: one level changes hands, if they have one
execute store result score @s cw_tmp run xp query @s levels
execute if score @s cw_tmp matches ..0 run return 0
xp add @s -1 levels
xp add @p[tag=kandy.cw_thief] 1 levels
execute at @s run particle minecraft:wax_on ~ ~1 ~ 0.3 0.4 0.3 0 8
execute at @p[tag=kandy.cw_thief] run playsound minecraft:entity.item.pickup player @a[distance=..16] ~ ~ ~ 1 0.6
