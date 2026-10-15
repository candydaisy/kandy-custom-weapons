# Run as an entity with Necrosis. Health is read in tenths; if it went up since last tick, deal the difference back
execute store result score @s dart_hp run data get entity @s Health 10
scoreboard players operation #d dart_tmp = @s dart_hp
scoreboard players operation #d dart_tmp -= @s dart_last
execute if score #d dart_tmp matches 1.. run function kandy:decay_dart/rot_start
execute unless score #d dart_tmp matches 1.. run scoreboard players operation @s dart_last = @s dart_hp

# Sickly look every few ticks
scoreboard players operation #m dart_tmp = @s dart_nec
scoreboard players set #5 dart_tmp 5
scoreboard players operation #m dart_tmp %= #5 dart_tmp
execute if score #m dart_tmp matches 0 run particle minecraft:dust{color:[0.2,0.6,0.2],scale:1.0} ~ ~1 ~ 0.3 0.5 0.3 0 3
execute if score #m dart_tmp matches 0 run particle minecraft:witch ~ ~1.4 ~ 0.2 0.3 0.2 0 1
