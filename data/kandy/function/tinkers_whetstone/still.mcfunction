# Run as a carrier: count how long they've stood still sneaking with a weapon in hand
scoreboard players add @s tnk_cd 0
execute unless predicate kandy:sneaking run return run scoreboard players set @s tnk_still 0
execute store result score #x tnk_tmp run data get entity @s Pos[0] 100
execute store result score #z tnk_tmp run data get entity @s Pos[2] 100
scoreboard players set #ok tnk_tmp 0
execute if score @s tnk_cd matches 0 if items entity @s weapon.mainhand #kandy:tinkers_whetstone_weapons if score #x tnk_tmp = @s tnk_x if score #z tnk_tmp = @s tnk_z run scoreboard players set #ok tnk_tmp 1
execute if score #ok tnk_tmp matches 0 run scoreboard players set @s tnk_still 0
execute if score #ok tnk_tmp matches 1 run scoreboard players add @s tnk_still 1
scoreboard players operation @s tnk_x = #x tnk_tmp
scoreboard players operation @s tnk_z = #z tnk_tmp
execute if score @s tnk_still matches 10 at @s run playsound minecraft:block.grindstone.use player @s ~ ~ ~ 0.4 1.4
execute if score @s tnk_still matches 25 at @s run playsound minecraft:block.grindstone.use player @s ~ ~ ~ 0.4 1.6
execute if score @s tnk_still matches 1.. at @s run particle minecraft:crit ~ ~1 ~ 0.3 0.2 0.3 0.02 1 normal @s
execute if score @s tnk_still matches 40.. at @s run function kandy:tinkers_whetstone/sharpen
