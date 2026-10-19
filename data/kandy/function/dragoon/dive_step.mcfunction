execute at @s unless block ~ ~-1 ~ #kandy:passable run return run function kandy:dragoon/land
execute at @s run tp @s ~ ~-1 ~
execute at @s run particle minecraft:dragon_breath ~ ~1 ~ 0.2 0.4 0.2 0 2
scoreboard players remove #steps dg_tmp 1
execute if score #steps dg_tmp matches 1.. run function kandy:dragoon/dive_step
