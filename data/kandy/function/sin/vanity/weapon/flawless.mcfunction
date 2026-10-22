# Run as and at a wielder who is whole again
tag @s add kandy.vain_on
function kandy:sin/tier
execute if score @s kandy.wt matches ..1 run attribute @s minecraft:attack_damage modifier add kandy:vanity_flawless 2 add_value
execute if score @s kandy.wt matches 2.. run attribute @s minecraft:attack_damage modifier add kandy:vanity_flawless 3 add_value
attribute @s minecraft:movement_speed modifier add kandy:vanity_flawless 0.05 add_multiplied_base
particle minecraft:end_rod ~ ~1 ~ 0.3 0.5 0.3 0.03 8
