# Run at an Overdrive victim: mark everything nearby for blast damage and set the floor alight
tag @e[distance=..2.5,type=!#kandy:unpullable,tag=!kandy.pyro_wielder,tag=!kandy.immune] add kandy.pyro_blast
particle minecraft:explosion ~ ~1 ~ 0 0 0 0 1
particle minecraft:lava ~ ~0.5 ~ 0.5 0.2 0.5 0 6
playsound minecraft:entity.generic.explode player @a[distance=..16] ~ ~ ~ 0.5 1.4
execute if block ~ ~ ~ minecraft:air unless block ~ ~-1 ~ #kandy:passable run setblock ~ ~ ~ minecraft:fire
