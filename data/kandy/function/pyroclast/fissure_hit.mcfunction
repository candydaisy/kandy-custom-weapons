# Run as each entity caught in the fissure: 8 damage (16 doubled), launch, Melt Armor for 5s
execute if entity @p[tag=kandy.pyro_double] run damage @s 16 kandy:magma by @p[tag=kandy.pyro_wielder]
execute unless entity @p[tag=kandy.pyro_double] run damage @s 8 kandy:magma by @p[tag=kandy.pyro_wielder]
execute if entity @s[type=!player] run data modify entity @s Motion[1] set value 0.8d
effect give @s[type=player] minecraft:levitation 1 2 true
attribute @s minecraft:armor modifier add kandy:melt -0.2 add_multiplied_total
scoreboard players set @s pyro_melt 100
particle minecraft:lava ~ ~0.5 ~ 0.3 0.3 0.3 0 8
