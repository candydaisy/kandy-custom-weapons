# Feet and head room open, and not lava or fire
execute unless block ~ ~ ~ #kandy:passable run return fail
execute unless block ~ ~1 ~ #kandy:passable run return fail
execute if block ~ ~ ~ minecraft:lava run return fail
execute if block ~ ~1 ~ minecraft:lava run return fail
execute if block ~ ~ ~ #minecraft:fire run return fail
return 1
