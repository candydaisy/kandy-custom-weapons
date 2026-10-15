# Move the player half a block along their look direction while there's room for their feet and head
execute positioned ^ ^ ^0.5 unless block ~ ~ ~ #kandy:passable run return 0
execute positioned ^ ^ ^0.5 unless block ~ ~1 ~ #kandy:passable run return 0
execute positioned ^ ^ ^0.5 if block ~ ~ ~ minecraft:lava run return 0
execute positioned ^ ^ ^0.5 run tp @s ~ ~ ~
particle minecraft:bubble ~ ~0.8 ~ 0.2 0.2 0.2 0.02 4
scoreboard players remove #steps pearl_tmp 1
execute if score #steps pearl_tmp matches 1.. at @s run function kandy:abyssal_pearl/dash_step
