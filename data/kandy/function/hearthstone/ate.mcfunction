# Advancement reward: finished a food. Carrying the Hearthstone adds a little Saturation
# (Saturation is instant, so 2 here means 2 ticks: about +2 food and +4 saturation)
advancement revoke @s only kandy:hearthstone/ate
execute if entity @s[tag=kandy.charm.hearthstone] run effect give @s minecraft:saturation 2 0 true
execute if entity @s[tag=kandy.charm.hearthstone] at @s run particle minecraft:small_flame ~ ~1 ~ 0.25 0.3 0.25 0.01 6
