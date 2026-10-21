# Leaves the pack's own weapon drawbacks alone, like the Alchemist Catalyst does
effect clear @s minecraft:weakness
effect clear @s minecraft:poison
execute unless entity @s[tag=kandy.lust.wi] run effect clear @s minecraft:darkness
execute unless entity @s[tag=kandy.lust.wi] unless entity @s[tag=kandy.main.worldbreaker] unless score @s pyro_oh matches 1.. unless score @s grav_vtx matches 1.. run effect clear @s minecraft:slowness
execute unless score @s pyro_oh matches 1.. run effect clear @s minecraft:mining_fatigue
