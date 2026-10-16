# 101 so the last of the 100 pull ticks runs before the end check
scoreboard players set @s grav_vtx 101
playsound minecraft:block.respawn_anchor.charge player @a[distance=..16] ~ ~ ~ 1 0.6
particle minecraft:reverse_portal ~ ~1 ~ 2 1 2 0.5 60 normal
