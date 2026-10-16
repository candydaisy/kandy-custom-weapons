execute as @a[tag=kandy.main.pyroclast,scores={pyro_od=0,pyro_heat=1..49}] at @s run particle minecraft:small_flame ~ ~0.1 ~ 0.3 0.05 0.3 0.01 1
execute as @a[tag=kandy.main.pyroclast,scores={pyro_od=0,pyro_heat=50..}] at @s run particle minecraft:flame ~ ~0.1 ~ 0.35 0.05 0.35 0.01 2
execute as @a[tag=kandy.main.pyroclast,scores={pyro_od=0,pyro_heat=50..}] at @s run particle minecraft:smoke ~ ~0.1 ~ 0.35 0.05 0.35 0.01 1
execute as @a[tag=kandy.main.pyroclast,scores={pyro_od=0,pyro_heat=50..}] at @s run particle minecraft:lava ~ ~0.1 ~ 0.3 0.05 0.3 0 1
execute as @a[scores={pyro_od=1..}] at @s run particle minecraft:end_rod ~ ~0.1 ~ 0.4 0.05 0.4 0.01 2
execute as @a[scores={pyro_od=1..}] at @s run particle minecraft:flame ~ ~0.1 ~ 0.45 0.05 0.45 0.01 4
execute as @a[scores={pyro_od=1..}] at @s run particle minecraft:white_ash ~ ~0.2 ~ 0.6 0.1 0.6 0 6

execute as @e[scores={pyro_melt=1..}] at @s run particle minecraft:dripping_lava ~ ~1 ~ 0.3 0.4 0.3 0 1
