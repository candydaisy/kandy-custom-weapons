# Only clear the Invisibility the cloak gave, never a potion's
execute if entity @s[tag=kandy.void_cloaked] run effect clear @s minecraft:invisibility
tag @s remove kandy.void_cloaked
scoreboard players set @s void_cloak 0
