# Run as the player, positioned at the chosen spot's block corner
execute at @s run particle minecraft:reverse_portal ~ ~1 ~ 0.4 0.8 0.4 0.1 40
execute at @s run playsound minecraft:entity.enderman.teleport player @a[distance=..16] ~ ~ ~ 1 0.8
tp @s ~0.5 ~ ~0.5
tag @s add kandy.way_arrived
