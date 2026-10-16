# Run as a carrier: count time spent in water or rain
scoreboard players set #wet ebr_tmp 0
execute if predicate kandy:enderbrace_in_water run scoreboard players set #wet ebr_tmp 1
execute if predicate kandy:enderbrace_in_rain run scoreboard players set #wet ebr_tmp 1
execute if score #wet ebr_tmp matches 0 run return run scoreboard players set @s ebr_wet 0
scoreboard players add @s ebr_wet 1
execute if score @s ebr_wet matches 40.. at @s run particle minecraft:portal ~ ~1 ~ 0.3 0.5 0.3 0.3 10
execute if score @s ebr_wet matches 40.. run damage @s 2 minecraft:drown
execute if score @s ebr_wet matches 40.. run scoreboard players set @s ebr_wet 0
