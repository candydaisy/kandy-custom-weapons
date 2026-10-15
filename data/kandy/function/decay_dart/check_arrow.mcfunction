# Run once per arrow
tag @s add dart.checked
execute if data entity @s item.components."minecraft:custom_data"{utility:"DecayDart"} run tag @s add dart.arrow
