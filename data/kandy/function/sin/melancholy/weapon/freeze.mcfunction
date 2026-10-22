# Run as and at a target: Frozen Solid for 1.5s, 2s from tier 2 (can't walk or jump). #freeze frost_tmp can shorten it (Nova)
scoreboard players set @s frost_stacks 0
scoreboard players set @s frost_timer 0
scoreboard players set @s frost_frozen 30
execute if score #wt frost_tmp matches 2.. run scoreboard players set @s frost_frozen 40
execute if score #freeze frost_tmp matches 1.. run scoreboard players operation @s frost_frozen = #freeze frost_tmp
attribute @s minecraft:movement_speed modifier remove kandy:frost_slow
attribute @s minecraft:movement_speed modifier add kandy:frost_freeze -1 add_multiplied_total
attribute @s minecraft:jump_strength modifier add kandy:frost_freeze -1 add_multiplied_total
execute if entity @s[type=!player] run data modify entity @s Motion set value [0.0d,0.0d,0.0d]
particle minecraft:block{block_state:{id:"minecraft:ice"}} ~ ~1 ~ 0.4 0.7 0.4 0 30
particle minecraft:snowflake ~ ~1 ~ 0.4 0.7 0.4 0.05 30
playsound minecraft:block.glass.break hostile @a[distance=..16] ~ ~ ~ 1 0.5
