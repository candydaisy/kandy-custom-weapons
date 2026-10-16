# Move half a block along the view while there's room for feet and head
execute positioned ^ ^ ^0.5 unless block ~ ~ ~ #kandy:passable run return 0
execute positioned ^ ^ ^0.5 unless block ~ ~1 ~ #kandy:passable run return 0
execute positioned ^ ^ ^0.5 if block ~ ~ ~ minecraft:lava run return 0
execute positioned ^ ^ ^0.5 run tp @s ~ ~ ~
scoreboard players set #moved ebr_tmp 1
scoreboard players remove #steps ebr_tmp 1
execute if score #steps ebr_tmp matches 1.. at @s run function kandy:enderbrace/step
