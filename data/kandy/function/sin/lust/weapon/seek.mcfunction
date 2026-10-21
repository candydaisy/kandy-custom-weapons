# Walk the line of sight half a block at a time until it meets a creature's hitbox or a wall
execute positioned ^ ^ ^0.5 unless block ~ ~ ~ #kandy:passable run return 0
execute positioned ^ ^ ^0.5 positioned ~-0.5 ~-0.5 ~-0.5 if entity @e[dx=0,dy=0,dz=0,type=!#kandy:unpullable,tag=!kandy.lust_self,tag=!kandy.immune] run return run tag @e[dx=0,dy=0,dz=0,type=!#kandy:unpullable,tag=!kandy.lust_self,tag=!kandy.immune,sort=nearest,limit=1] add kandy.lust_target
scoreboard players remove #steps lust_tmp 1
execute if score #steps lust_tmp matches 1.. positioned ^ ^ ^0.5 run function kandy:sin/lust/weapon/seek
