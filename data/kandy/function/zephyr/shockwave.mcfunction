# Wind burst on landing: 4 damage and knockback to everything within 5 blocks
scoreboard players set @s zeph_cd 60
tag @s add kandy.zephyr_src
execute as @e[distance=..5,type=!#kandy:unpullable,type=!#minecraft:boat,tag=!kandy.zephyr_src,tag=!kandy.immune] run damage @s 4 minecraft:wind_charge at ~ ~ ~
execute as @e[distance=..5,type=!#kandy:unpullable,type=!#minecraft:boat,type=!minecraft:player,tag=!kandy.zephyr_src] run data modify entity @s Motion[1] set value 0.6d
tag @s remove kandy.zephyr_src

particle minecraft:gust ~ ~0.5 ~ 1.5 0.2 1.5 0 6
particle minecraft:cloud ~ ~0.2 ~ 2 0.1 2 0.2 40
playsound minecraft:entity.breeze.wind_burst player @a[distance=..24] ~ ~ ~ 1 0.8
