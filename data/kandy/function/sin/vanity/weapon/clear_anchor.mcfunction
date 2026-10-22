# Remove this player's anchor marker, wherever it is
scoreboard players operation #id chr_id = @s chr_id
execute as @e[type=minecraft:marker,tag=kandy.chr_anchor] if score @s chr_id = #id chr_id run kill @s
