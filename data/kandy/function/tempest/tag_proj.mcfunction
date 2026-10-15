# Run as each trident once
tag @s add kandy.tem_seen
execute if items entity @s contents *[custom_data~{ability:"Tempest"}] run tag @s add kandy.tem_proj
execute if data entity @s item.components."minecraft:custom_data"{ability:"Tempest"} run tag @s add kandy.tem_proj

