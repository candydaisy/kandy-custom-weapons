# Run as a player holding a sin weapon: kandy.wt = its tier (pre-revamp items have none and count as 1)
# Read on demand (hits, Overdrive) rather than every tick, since it reads the player's NBT
execute store result score @s kandy.wt run data get entity @s SelectedItem.components."minecraft:custom_data".tier
execute unless score @s kandy.wt matches 1..3 run scoreboard players set @s kandy.wt 1
