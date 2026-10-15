tag @s add kandy.puller
execute as @e[distance=2..10,type=!#kandy:unpullable,tag=!kandy.immune] at @s facing entity @p[tag=kandy.puller] feet rotated ~ 0 if block ^ ^ ^0.5 #kandy:passable if block ^ ^1 ^0.5 #kandy:passable run tp @s ^ ^ ^0.1
tag @s remove kandy.puller
