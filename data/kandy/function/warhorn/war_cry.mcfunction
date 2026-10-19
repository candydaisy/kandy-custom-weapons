# War Cry: other players within 16 blocks get Strength I + Speed I for 8s, you for 4s
effect give @a[distance=0.01..16] minecraft:strength 8 0
effect give @a[distance=0.01..16] minecraft:speed 8 0
effect give @s minecraft:strength 4 0
effect give @s minecraft:speed 4 0
particle minecraft:angry_villager ~ ~1.5 ~ 3 0.5 3 0 20
execute as @a[distance=0.01..16] at @s run particle minecraft:crit ~ ~1 ~ 0.3 0.5 0.3 0.2 10
