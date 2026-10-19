# Rally: players within 16 blocks (you too) are cleansed and get Resistance I for 6s; close monsters are shoved back
execute as @a[distance=..16] run function kandy:warhorn/cleanse
effect give @a[distance=..16] minecraft:resistance 6 0
tag @s add kandy.wh_caller
execute as @e[type=#kandy:monsters,distance=..6] at @s facing entity @p[tag=kandy.wh_caller] feet rotated ~ 0 if block ^ ^ ^-1.5 #kandy:passable if block ^ ^1 ^-1.5 #kandy:passable run tp @s ^ ^ ^-1.5
execute as @e[type=#kandy:monsters,distance=..6] at @s facing entity @p[tag=kandy.wh_caller] feet rotated ~ 0 if block ^ ^ ^-1.5 #kandy:passable if block ^ ^1 ^-1.5 #kandy:passable run tp @s ^ ^ ^-1.5
tag @s remove kandy.wh_caller
particle minecraft:totem_of_undying ~ ~1 ~ 3 0.5 3 0.2 40
