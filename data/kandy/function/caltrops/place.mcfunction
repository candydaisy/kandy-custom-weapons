# Run as the placer, positioned at the field's center
summon minecraft:marker ~ ~ ~ {Tags:["calt.field","calt.new"]}
scoreboard players operation @e[type=marker,tag=calt.new] calt_id = @s calt_id
scoreboard players set @e[type=marker,tag=calt.new] calt_life 240
tag @e[type=marker,tag=calt.new] remove calt.new
particle minecraft:crit ~ ~0.2 ~ 2 0.1 2 0.1 40
particle minecraft:block{block_state:{id:"minecraft:iron_bars"}} ~ ~0.2 ~ 2 0.1 2 0 30
playsound minecraft:block.chain.fall player @a[distance=..16] ~ ~ ~ 1 1.4
playsound minecraft:entity.item.break player @a[distance=..16] ~ ~ ~ 0.6 1.8
