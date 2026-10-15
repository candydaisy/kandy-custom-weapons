# Run as and at the attacker
damage @s 2 kandy:molten_core_burn by @p[tag=kandy.molt_busy]
execute if entity @s[type=!player] run data merge entity @s {Fire:80s}
particle minecraft:flame ~ ~1 ~ 0.3 0.5 0.3 0.03 10
