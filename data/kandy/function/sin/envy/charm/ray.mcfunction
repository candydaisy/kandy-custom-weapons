# Step along the view in half blocks until a solid block, a creature, or 48 blocks
execute unless block ~ ~ ~ #kandy:passable run return 0
execute positioned ~-0.5 ~-0.5 ~-0.5 as @e[dx=0,dy=0,dz=0,type=!#kandy:unpullable,tag=!kandy.wat_self,tag=!kandy.immune,limit=1] run return run function kandy:sin/envy/charm/hit
scoreboard players remove #steps wat_t 1
execute if score #steps wat_t matches 1.. positioned ^ ^ ^0.5 run function kandy:sin/envy/charm/ray
