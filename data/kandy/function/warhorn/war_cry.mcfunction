# War Cry: you and teammates within 16 blocks get Strength III + Speed III for 10s
function kandy:team/tag_allies {r:16}
tag @s add kandy.ally
effect give @a[tag=kandy.ally] minecraft:strength 10 2
effect give @a[tag=kandy.ally] minecraft:speed 10 2
execute as @a[tag=kandy.ally] at @s run particle minecraft:crit ~ ~1 ~ 0.3 0.5 0.3 0.2 10
tag @a remove kandy.ally
particle minecraft:angry_villager ~ ~1.5 ~ 3 0.5 3 0 20
