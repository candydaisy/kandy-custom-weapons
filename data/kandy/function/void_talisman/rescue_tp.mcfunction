# Only if the spot is still open (no block placed there since)
$execute positioned $(x) $(y) $(z) if block ~ ~ ~ #kandy:passable if block ~ ~1 ~ #kandy:passable run tag @s add kandy.void_moved
$execute if entity @s[tag=kandy.void_moved] run tp @s $(x) $(y) $(z)
