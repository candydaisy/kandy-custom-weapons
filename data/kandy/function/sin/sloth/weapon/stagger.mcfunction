# Run as the attacker that got parried
effect give @s minecraft:slowness 2 3 true
effect give @s minecraft:weakness 2 1 true
particle minecraft:bubble ~ ~1 ~ 0.4 0.6 0.4 0.05 20
particle minecraft:splash ~ ~1.5 ~ 0.3 0.3 0.3 0.1 20
# Tier 3: rooted for 0.5s
execute if score #wt bulw_tmp matches 3.. run function kandy:sin/sloth/weapon/root
