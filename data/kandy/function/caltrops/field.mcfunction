# Run as and at a caltrop field marker every tick
scoreboard players remove @s calt_life 1
execute if score @s calt_life matches ..0 run return run kill @s

scoreboard players operation #own calt_tmp = @s calt_id
execute as @a if score @s calt_id = #own calt_tmp run tag @s add calt.owner

# Spikes on the ground every 4 ticks; the placer also sees a green outline so they know it's theirs
scoreboard players operation #m calt_tmp = @s calt_life
scoreboard players operation #m calt_tmp %= #4 calt_tmp
execute if score #m calt_tmp matches 0 run particle minecraft:block{block_state:{id:"minecraft:iron_bars"}} ~ ~0.1 ~ 1.5 0 1.5 0 3
execute if score #m calt_tmp matches 0 run particle minecraft:crit ~ ~0.1 ~ 1.5 0 1.5 0 3
execute if score #m calt_tmp matches 0 run particle minecraft:ash ~ ~0.2 ~ 1.5 0 1.5 0 4
execute if score #m calt_tmp matches 0 run particle minecraft:happy_villager ~ ~0.1 ~ 1.5 0 1.5 0 2 force @a[tag=calt.owner]

# Anything living in the 5x5 area (not the placer) gets punctured, at most once every 1.5s
execute positioned ~-2.5 ~-0.5 ~-2.5 as @e[dx=4,dy=1,dz=4,type=!#kandy:unpullable,type=!#minecraft:boat,tag=!calt.owner,tag=!kandy.immune] unless score @s calt_hit matches 1.. at @s run function kandy:caltrops/puncture
tag @a remove calt.owner
