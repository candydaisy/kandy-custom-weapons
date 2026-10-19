execute as @e[type=minecraft:wolf,tag=kandy.bst_pack] run attribute @s minecraft:attack_damage modifier remove kandy:bst_pack
tag @e remove kandy.bst_pack
scoreboard objectives remove bst_id
scoreboard objectives remove bst_own
scoreboard objectives remove bst_hp
scoreboard objectives remove bst_calm
scoreboard objectives remove bst_cd
scoreboard objectives remove bst_still
scoreboard objectives remove bst_x
scoreboard objectives remove bst_z
scoreboard objectives remove bst_t
scoreboard objectives remove bst_tmp
data remove storage kandy:beast me
data remove storage kandy:beast c
