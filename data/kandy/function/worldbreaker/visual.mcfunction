execute as @a[scores={grav_vtx=1..}] at @s run particle minecraft:reverse_portal ~ ~1 ~ 1.5 1.5 1.5 0.1 8 normal
execute as @e[scores={grav_pull=1..}] at @s run particle minecraft:falling_dust{block_state:{id:obsidian}} ~ ~1 ~ 0.3 0.8 0.3 0.05 3

execute as @a[scores={grav_vtx=1..}] at @s run playsound minecraft:block.beacon.ambient player @s ~ ~ ~ 0.3 0.8
