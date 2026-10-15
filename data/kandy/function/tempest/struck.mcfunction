execute if entity @a[tag=kandy.tem_wielder] run damage @s 8 minecraft:lightning_bolt by @p[tag=kandy.tem_wielder]
execute unless entity @a[tag=kandy.tem_wielder] run damage @s 8 minecraft:lightning_bolt
execute if entity @s[type=!player] run data modify entity @s Motion[1] set value 0.7d
effect give @s[type=player] minecraft:levitation 1 2 true
particle minecraft:electric_spark ~ ~1 ~ 0.3 0.6 0.3 0.2 15
