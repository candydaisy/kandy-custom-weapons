particle minecraft:block{block_state:{id:"minecraft:magma_block"}} ~ ~0.1 ~ 0.4 0.1 0.4 0 10
particle minecraft:lava ~ ~0.2 ~ 0.3 0.1 0.3 0 2
particle minecraft:flame ~ ~0.5 ~ 0.2 0.6 0.2 0.05 6
particle minecraft:campfire_cosy_smoke ~ ~0.5 ~ 0.2 0.4 0.2 0.02 1
execute positioned ~-1 ~-0.5 ~-1 run tag @e[dx=1,dy=2,dz=1,type=!#kandy:unpullable,tag=!kandy.pyro_wielder,tag=!kandy.immune] add kandy.fissure_hit

# Follow the ground one block up or down per step, stop at walls
scoreboard players remove #steps pyro_tmp 1
execute if score #steps pyro_tmp matches ..0 run return 0
execute unless block ^ ^ ^1 #kandy:passable if block ^ ^1 ^1 #kandy:passable positioned ^ ^1 ^1 run return run function kandy:sin/wrath/weapon/fissure_step
execute if block ^ ^ ^1 #kandy:passable if block ^ ^-1 ^1 #kandy:passable positioned ^ ^-1 ^1 run return run function kandy:sin/wrath/weapon/fissure_step
execute if block ^ ^ ^1 #kandy:passable positioned ^ ^ ^1 run function kandy:sin/wrath/weapon/fissure_step
