# Skyward Wrath: the bolt goes to the nearest other creature within 12 blocks of the one you hit
# (or the one you hit, if nobody else is near) and lands 0.75s later
scoreboard players set @s tem_scd 200
execute unless score @s tem_id matches 1.. store result score @s tem_id run scoreboard players add #next tem_id 1

tag @e[tag=kandy.victim,sort=nearest,limit=1] add kandy.tem_origin
execute as @e[tag=kandy.tem_origin] at @s run tag @e[distance=..12,type=!#kandy:unpullable,tag=!kandy.victim,tag=!kandy.tem_wielder,tag=!kandy.immune,sort=nearest,limit=1] add kandy.tem_target
execute unless entity @e[tag=kandy.tem_target] run tag @e[tag=kandy.tem_origin] add kandy.tem_target
execute at @e[tag=kandy.tem_target,limit=1] run function kandy:tempest/drop
tag @e[tag=kandy.tem_origin] remove kandy.tem_origin
tag @e[tag=kandy.tem_target] remove kandy.tem_target

particle minecraft:wax_off ~ ~1 ~ 0.3 1.5 0.3 0.5 30
particle minecraft:electric_spark ~ ~1.5 ~ 0.3 1 0.3 0.2 20
playsound minecraft:item.trident.thunder player @a[distance=..24] ~ ~ ~ 0.6 1.6
