# Thaw out of Frozen Solid; can't be frozen again for 5s
attribute @s minecraft:movement_speed modifier remove kandy:frost_freeze
attribute @s minecraft:jump_strength modifier remove kandy:frost_freeze
scoreboard players set @s frost_frozen 0
scoreboard players set @s frost_imm 100
