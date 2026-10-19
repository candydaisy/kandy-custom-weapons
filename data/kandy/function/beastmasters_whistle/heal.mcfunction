execute store result score #max bst_tmp run attribute @s minecraft:max_health get 10
execute if score #hp bst_tmp >= #max bst_tmp run return 0
scoreboard players add #hp bst_tmp 10
execute if score #hp bst_tmp > #max bst_tmp run scoreboard players operation #hp bst_tmp = #max bst_tmp
execute store result entity @s Health float 0.1 run scoreboard players get #hp bst_tmp
scoreboard players operation @s bst_hp = #hp bst_tmp
execute at @s run particle minecraft:heart ~ ~0.8 ~ 0.2 0.2 0.2 0 1
