# Run as an owned pet once a second: after 5s without losing health, +1 HP a second
execute store result score #hp bst_tmp run data get entity @s Health 10
execute if score #hp bst_tmp matches ..0 run return 0
execute if score #hp bst_tmp < @s bst_hp run scoreboard players set @s bst_calm 0
scoreboard players operation @s bst_hp = #hp bst_tmp
scoreboard players add @s bst_calm 1
execute if score @s bst_calm matches 6.. run function kandy:beastmasters_whistle/heal
