# A potion was drunk or splashed on this player this tick: extend each beneficial effect whose
# duration went up since last tick (20s to 8min only, so beacons and short pack effects are skipped)
scoreboard players set #ext alch_tmp 0
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:speed"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_speed run function kandy:alchemist/extend {id:"minecraft:speed"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:haste"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_haste run function kandy:alchemist/extend {id:"minecraft:haste"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:strength"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_strength run function kandy:alchemist/extend {id:"minecraft:strength"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:jump_boost"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_jump run function kandy:alchemist/extend {id:"minecraft:jump_boost"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:regeneration"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_regen run function kandy:alchemist/extend {id:"minecraft:regeneration"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:resistance"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_resist run function kandy:alchemist/extend {id:"minecraft:resistance"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:fire_resistance"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_fireres run function kandy:alchemist/extend {id:"minecraft:fire_resistance"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:water_breathing"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_water run function kandy:alchemist/extend {id:"minecraft:water_breathing"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:invisibility"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_invisibility run function kandy:alchemist/extend {id:"minecraft:invisibility"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:night_vision"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_nightvis run function kandy:alchemist/extend {id:"minecraft:night_vision"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:health_boost"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_hpboost run function kandy:alchemist/extend {id:"minecraft:health_boost"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:absorption"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_absorption run function kandy:alchemist/extend {id:"minecraft:absorption"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:slow_falling"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_slowfall run function kandy:alchemist/extend {id:"minecraft:slow_falling"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:luck"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_luck run function kandy:alchemist/extend {id:"minecraft:luck"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:dolphins_grace"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_dolphin run function kandy:alchemist/extend {id:"minecraft:dolphins_grace"}
scoreboard players set #cur alch_tmp 0
execute store result score #cur alch_tmp run data get storage kandy:alchemist fx[{id:"minecraft:conduit_power"}].duration
execute if score #cur alch_tmp matches 400..9599 if score #cur alch_tmp > @s alch_l_conduit run function kandy:alchemist/extend {id:"minecraft:conduit_power"}

execute if score #ext alch_tmp matches 0 run return 0
data modify storage kandy:alchemist fx set from entity @s active_effects
playsound minecraft:block.brewing_stand.brew player @s ~ ~ ~ 0.6 1.4
particle minecraft:witch ~ ~1 ~ 0.3 0.4 0.3 0.02 6
