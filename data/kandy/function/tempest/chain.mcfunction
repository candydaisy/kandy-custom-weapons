# Run at a victim: arc to the 2 nearest other creatures within 6 blocks
tag @s add kandy.tem_src
particle minecraft:electric_spark ~ ~1 ~ 0.3 0.5 0.3 0.1 8
tag @e[distance=0.01..6,type=!#kandy:unpullable,tag=!kandy.tem_wielder,tag=!kandy.immune,tag=!kandy.victim,tag=!kandy.tem_zapped,sort=nearest,limit=2] add kandy.tem_next
execute as @e[tag=kandy.tem_next] at @s run function kandy:tempest/zap
tag @e[tag=kandy.tem_next] add kandy.tem_zapped
tag @e[tag=kandy.tem_next] remove kandy.tem_next
tag @s remove kandy.tem_src
