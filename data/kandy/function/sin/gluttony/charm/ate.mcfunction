# Advancement reward: finished a food. Carrying the Hearthstone: Hearty Meals, every bite feeds you more
# (Saturation is instant, so 4 here means 4 ticks: +4 food and +8 saturation)
advancement revoke @s only kandy:sin/gluttony/ate
execute unless entity @s[tag=kandy.gluttony.c] run return 0
effect give @s minecraft:saturation 4 0 true
effect give @s minecraft:regeneration 5 0 true
particle minecraft:small_flame ~ ~1 ~ 0.25 0.3 0.25 0.01 6
playsound minecraft:entity.player.burp player @s ~ ~ ~ 0.5 1.2
