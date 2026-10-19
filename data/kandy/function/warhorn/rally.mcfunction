# Rally: you and teammates within 16 blocks are cleansed and get Resistance III for 10s; close monsters are shoved back
function kandy:team/tag_allies {r:16}
tag @s add kandy.ally
execute as @a[tag=kandy.ally] run function kandy:warhorn/cleanse
effect give @a[tag=kandy.ally] minecraft:resistance 10 2
tag @a remove kandy.ally
tag @s add kandy.wh_caller
execute as @e[type=#kandy:monsters,distance=..6] at @s facing entity @p[tag=kandy.wh_caller] feet rotated ~ 0 if block ^ ^ ^-1.5 #kandy:passable if block ^ ^1 ^-1.5 #kandy:passable run tp @s ^ ^ ^-1.5
execute as @e[type=#kandy:monsters,distance=..6] at @s facing entity @p[tag=kandy.wh_caller] feet rotated ~ 0 if block ^ ^ ^-1.5 #kandy:passable if block ^ ^1 ^-1.5 #kandy:passable run tp @s ^ ^ ^-1.5
tag @s remove kandy.wh_caller
particle minecraft:totem_of_undying ~ ~1 ~ 3 0.5 3 0.2 40
