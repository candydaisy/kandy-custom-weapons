# Run as an attacker parried by a tier 3 Bulwark: it can't move or jump for 0.5s
scoreboard players set @s bulw_root 10
tag @s add kandy.bulw_rooted
attribute @s minecraft:movement_speed modifier remove kandy:bulwark_root
attribute @s minecraft:movement_speed modifier add kandy:bulwark_root -1 add_multiplied_total
attribute @s minecraft:jump_strength modifier remove kandy:bulwark_root
attribute @s minecraft:jump_strength modifier add kandy:bulwark_root -1 add_multiplied_total
particle minecraft:nautilus ~ ~0.2 ~ 0.4 0.1 0.4 0.3 20
