# Gilded Weight: -5% speed for every 64 valuables carried (in ingots; blocks count 9, nuggets 1/9), up to -25%
# (-35% while also carrying a tier 3 arbalest). Only re-applied when the weight changes
scoreboard players set @a plc_gw 0
execute as @a[tag=kandy.greed.c] run function kandy:sin/greed/charm/weigh
execute as @a unless score @s plc_gw = @s plc_gwp run function kandy:sin/greed/charm/burden
# A creature killed by damage can't be selected, but its passenger can still reach it (kill):
# mark the creatures near each carrier with an invisible rider, and clear riders whose creature is gone
execute as @a[tag=kandy.greed.c] at @s as @e[distance=..48,type=!#kandy:plunderers_coin_unmarked,tag=!kandy.plc_marked] run function kandy:sin/greed/charm/mark
kill @e[type=minecraft:item_display,tag=kandy.plc_eye,predicate=!kandy:riding]
