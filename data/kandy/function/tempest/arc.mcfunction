# Draw the bolt from the source toward @s, half a block at a time
particle minecraft:electric_spark ~ ~ ~ 0.05 0.05 0.05 0 2
scoreboard players remove #steps tem_tmp 1
execute if score #steps tem_tmp matches ..0 run return 0
execute if entity @s[distance=..2] run return 0
execute positioned ^ ^ ^0.5 run function kandy:tempest/arc
