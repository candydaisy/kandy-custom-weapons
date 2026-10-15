# -10% movement speed per Hypothermia stack
attribute @s minecraft:movement_speed modifier remove kandy:frost_slow
execute if score @s frost_stacks matches 1 run attribute @s minecraft:movement_speed modifier add kandy:frost_slow -0.1 add_multiplied_total
execute if score @s frost_stacks matches 2 run attribute @s minecraft:movement_speed modifier add kandy:frost_slow -0.2 add_multiplied_total
execute if score @s frost_stacks matches 3 run attribute @s minecraft:movement_speed modifier add kandy:frost_slow -0.3 add_multiplied_total
execute if score @s frost_stacks matches 4.. run attribute @s minecraft:movement_speed modifier add kandy:frost_slow -0.4 add_multiplied_total
