# Run as each carrier every tick. Snapshot beneficial effect durations so a newly applied potion
# shows up as a jump in duration; only those get extended, never the same potion twice
data modify storage kandy:alchemist fx set value []
data modify storage kandy:alchemist fx set from entity @s active_effects
execute if score @s alch_evt matches 1 run function kandy:alchemist/check

scoreboard players set @s alch_l_speed 0
execute store result score @s alch_l_speed run data get storage kandy:alchemist fx[{id:"minecraft:speed"}].duration
scoreboard players set @s alch_l_haste 0
execute store result score @s alch_l_haste run data get storage kandy:alchemist fx[{id:"minecraft:haste"}].duration
scoreboard players set @s alch_l_strength 0
execute store result score @s alch_l_strength run data get storage kandy:alchemist fx[{id:"minecraft:strength"}].duration
scoreboard players set @s alch_l_jump 0
execute store result score @s alch_l_jump run data get storage kandy:alchemist fx[{id:"minecraft:jump_boost"}].duration
scoreboard players set @s alch_l_regen 0
execute store result score @s alch_l_regen run data get storage kandy:alchemist fx[{id:"minecraft:regeneration"}].duration
scoreboard players set @s alch_l_resist 0
execute store result score @s alch_l_resist run data get storage kandy:alchemist fx[{id:"minecraft:resistance"}].duration
scoreboard players set @s alch_l_fireres 0
execute store result score @s alch_l_fireres run data get storage kandy:alchemist fx[{id:"minecraft:fire_resistance"}].duration
scoreboard players set @s alch_l_water 0
execute store result score @s alch_l_water run data get storage kandy:alchemist fx[{id:"minecraft:water_breathing"}].duration
scoreboard players set @s alch_l_invisibility 0
execute store result score @s alch_l_invisibility run data get storage kandy:alchemist fx[{id:"minecraft:invisibility"}].duration
scoreboard players set @s alch_l_nightvis 0
execute store result score @s alch_l_nightvis run data get storage kandy:alchemist fx[{id:"minecraft:night_vision"}].duration
scoreboard players set @s alch_l_hpboost 0
execute store result score @s alch_l_hpboost run data get storage kandy:alchemist fx[{id:"minecraft:health_boost"}].duration
scoreboard players set @s alch_l_absorption 0
execute store result score @s alch_l_absorption run data get storage kandy:alchemist fx[{id:"minecraft:absorption"}].duration
scoreboard players set @s alch_l_slowfall 0
execute store result score @s alch_l_slowfall run data get storage kandy:alchemist fx[{id:"minecraft:slow_falling"}].duration
scoreboard players set @s alch_l_luck 0
execute store result score @s alch_l_luck run data get storage kandy:alchemist fx[{id:"minecraft:luck"}].duration
scoreboard players set @s alch_l_dolphin 0
execute store result score @s alch_l_dolphin run data get storage kandy:alchemist fx[{id:"minecraft:dolphins_grace"}].duration
scoreboard players set @s alch_l_conduit 0
execute store result score @s alch_l_conduit run data get storage kandy:alchemist fx[{id:"minecraft:conduit_power"}].duration
