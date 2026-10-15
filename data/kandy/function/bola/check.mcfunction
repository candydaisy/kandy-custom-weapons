# Run once per snowball, the tick after it's thrown
tag @s add bola.seen
scoreboard players set #is bola_tmp 0
execute if data entity @s Item.components."minecraft:custom_data"{utility:"EntanglementBola"} run scoreboard players set #is bola_tmp 1
execute if data entity @s item.components."minecraft:custom_data"{utility:"EntanglementBola"} run scoreboard players set #is bola_tmp 1
execute if score #is bola_tmp matches 0 run return 0

tag @s add bola.proj
scoreboard players add #next bola_id 1
scoreboard players operation @s bola_id = #next bola_id
execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["bola.tracker","bola.new"]}
scoreboard players operation @e[type=marker,tag=bola.new] bola_id = #next bola_id
scoreboard players set @e[type=marker,tag=bola.new] bola_life 100
data modify entity @e[type=marker,tag=bola.new,limit=1] data.owner set from entity @s Owner
tag @e[type=marker,tag=bola.new] remove bola.new
execute at @s run playsound minecraft:entity.leash_knot.place player @a[distance=..16] ~ ~ ~ 1 0.7
