# Step half a block along the view; stop at the first creature or solid block
execute positioned ~-0.5 ~-0.5 ~-0.5 as @e[dx=0,dy=0,dz=0,tag=!kandy.fl_self,type=!#kandy:unpullable,limit=1] run tag @s add kandy.fl_ray
execute if entity @e[tag=kandy.fl_ray] run return 0
execute unless block ~ ~ ~ #kandy:passable run return 0
scoreboard players remove #steps fl_tmp 1
execute if score #steps fl_tmp matches 1.. positioned ^ ^ ^0.5 run function kandy:falconer/ray
