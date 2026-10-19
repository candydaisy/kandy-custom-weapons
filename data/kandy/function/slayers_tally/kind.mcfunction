# Run as a creature: which tally it counts toward (1-10), or fail
execute if entity @s[type=#minecraft:zombies] run return 1
execute if entity @s[type=#minecraft:skeletons] run return 2
execute if entity @s[type=#kandy:slayers_tally_spiders] run return 3
execute if entity @s[type=minecraft:creeper] run return 4
execute if entity @s[type=minecraft:enderman] run return 5
execute if entity @s[type=minecraft:blaze] run return 6
execute if entity @s[type=#kandy:slayers_tally_piglins] run return 7
execute if entity @s[type=#kandy:slayers_tally_illagers] run return 8
execute if entity @s[type=#kandy:slayers_tally_slimes] run return 9
execute if entity @s[type=#kandy:monsters] run return 10
return fail
