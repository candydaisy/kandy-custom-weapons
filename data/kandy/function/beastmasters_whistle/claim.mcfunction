# Run as and at a carrier: mark every pet they own in this dimension, and the wolves within 24 blocks as the pack
execute unless score @s bst_id matches 1.. store result score @s bst_id run scoreboard players add #next bst_id 1
scoreboard players operation #o bst_tmp = @s bst_id
data modify storage kandy:beast me set from entity @s UUID
execute as @e[type=#kandy:beastmasters_whistle_pets,distance=0..] if function kandy:beastmasters_whistle/mine run scoreboard players operation @s bst_own = #o bst_tmp
execute as @e[type=minecraft:wolf,distance=..24] if score @s bst_own = #o bst_tmp run function kandy:beastmasters_whistle/pack
