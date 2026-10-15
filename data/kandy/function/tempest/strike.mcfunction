# The bolt lands: 8 lightning damage within 3 blocks and a launch. Visual bolt only, so no fires or mob conversions
scoreboard players operation #id tem_tmp = @s tem_id
execute as @a if score @s tem_id = #id tem_tmp run tag @s add kandy.tem_wielder
tag @a[tag=kandy.tem_wielder] add kandy.tem_busy

particle minecraft:electric_spark ~ ~12 ~ 0.1 12 0.1 0 200 force
particle minecraft:end_rod ~ ~12 ~ 0.05 12 0.05 0 80 force
particle minecraft:explosion ~ ~0.5 ~ 0.6 0.2 0.6 0 4 force
particle minecraft:electric_spark ~ ~0.3 ~ 1.5 0.2 1.5 0.4 60 force
playsound minecraft:entity.lightning_bolt.thunder weather @a[distance=..64] ~ ~ ~ 2 1
playsound minecraft:entity.lightning_bolt.impact player @a[distance=..24] ~ ~ ~ 1.5 1

execute as @e[distance=..3,type=!#kandy:unpullable,tag=!kandy.tem_wielder,tag=!kandy.immune] at @s run function kandy:tempest/struck

tag @a[tag=kandy.tem_wielder] remove kandy.tem_busy
tag @a remove kandy.tem_wielder
kill @s
