# Run as and at a carrier: count how long they've stood still sneaking (Tinker's Whetstone pattern)
scoreboard players add @s bst_cd 0
execute unless predicate kandy:sneaking run return run scoreboard players set @s bst_still 0
execute store result score #x bst_tmp run data get entity @s Pos[0] 100
execute store result score #z bst_tmp run data get entity @s Pos[2] 100
scoreboard players set #ok bst_tmp 0
execute if score @s bst_cd matches 0 if score #x bst_tmp = @s bst_x if score #z bst_tmp = @s bst_z run scoreboard players set #ok bst_tmp 1
execute if score #ok bst_tmp matches 0 run scoreboard players set @s bst_still 0
execute if score #ok bst_tmp matches 1 run scoreboard players add @s bst_still 1
scoreboard players operation @s bst_x = #x bst_tmp
scoreboard players operation @s bst_z = #z bst_tmp
execute if score @s bst_still matches 20.. run function kandy:beastmasters_whistle/recall
