# Move half a block along your view while there's room for your feet and head
execute positioned ^ ^ ^0.5 unless block ~ ~ ~ #kandy:passable run return 0
execute positioned ^ ^ ^0.5 unless block ~ ~1 ~ #kandy:passable run return 0
execute positioned ^ ^ ^0.5 if block ~ ~ ~ minecraft:lava run return 0
execute positioned ^ ^ ^0.5 run tp @s ~ ~ ~
particle minecraft:cloud ~ ~1 ~ 0.15 0.15 0.15 0.01 2
particle minecraft:sweep_attack ~ ~1 ~ 0 0 0 0 1
tag @e[distance=..1.5,type=!#kandy:unpullable,tag=!kandy.tem_wielder,tag=!kandy.immune] add kandy.tem_gust
scoreboard players remove #steps tem_tmp 1
execute if score #steps tem_tmp matches 1.. at @s run function kandy:tempest/surge_step
