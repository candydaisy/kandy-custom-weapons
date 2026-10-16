# Run as the warper, positioned at the safe spot
execute at @s run function kandy:eclipse/decoy
tp @s ~ ~ ~
effect give @s minecraft:slow_falling 1 0 true
scoreboard players set @s ecl_warp 200
kill @e[type=#minecraft:arrows,tag=ecl.chosen]
particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.6 0.3 0.3 40
playsound minecraft:entity.enderman.teleport player @a[distance=..16] ~ ~ ~ 1 0.7
tag @s remove ecl.warper
