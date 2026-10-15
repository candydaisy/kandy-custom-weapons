# The Singularity opens: 2.5s vortex at this marker, lifted a block off the ground if there's room
execute if block ~ ~1 ~ #kandy:passable run tp @s ~ ~1 ~
tag @s remove ecl.tracker
tag @s add ecl.vortex
scoreboard players set @s ecl_life 50
execute at @s run particle minecraft:reverse_portal ~ ~0.5 ~ 0.5 0.5 0.5 0.5 80
playsound minecraft:block.portal.trigger player @a[distance=..24] ~ ~ ~ 0.6 1.8
playsound minecraft:entity.warden.sonic_charge player @a[distance=..24] ~ ~ ~ 1 0.7
