# Gilded Weight: -5% speed for every 64 valuables carried (in ingots; blocks count 9, nuggets 1/9), up to -25%
# (-35% while also carrying a tier 3 arbalest). Only re-applied when the weight changes
scoreboard players set @a plc_gw 0
execute as @a[tag=kandy.greed.c] run function kandy:sin/greed/charm/weigh
execute as @a unless score @s plc_gw = @s plc_gwp run function kandy:sin/greed/charm/burden
