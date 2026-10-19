# Dive impact: 6 damage to everything within 3 blocks, shoved away; you're rooted
scoreboard players set #steps dg_tmp 0
scoreboard players set @s dg_dive 0
scoreboard players set @s dg_st 0
scoreboard players set @s dg_cd 240
tag @s add kandy.dg_lander
execute at @s as @e[distance=0.01..3,type=!#kandy:unpullable,tag=!kandy.immune] run damage @s 6 kandy:dragoon_pierce by @p[tag=kandy.dg_lander]
execute at @s as @e[distance=0.01..3,type=!#kandy:unpullable,type=!player,tag=!kandy.immune] at @s facing entity @p[tag=kandy.dg_lander] feet rotated ~ 0 if block ^ ^ ^-1.5 #kandy:passable if block ^ ^1 ^-1.5 #kandy:passable run tp @s ^ ^ ^-1.5
tag @s remove kandy.dg_lander
effect give @s minecraft:slowness 2 2 true
execute at @s run particle minecraft:explosion ~ ~0.3 ~ 1 0.1 1 0 4
execute at @s run particle minecraft:dragon_breath ~ ~0.3 ~ 2 0.1 2 0.02 40
execute at @s run playsound minecraft:entity.generic.explode player @a[distance=..24] ~ ~ ~ 0.8 1.4
