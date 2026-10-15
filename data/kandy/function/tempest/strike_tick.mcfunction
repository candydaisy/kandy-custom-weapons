scoreboard players remove @s tem_t 1
execute if score @s tem_t matches 1.. run function kandy:tempest/ring
execute if score @s tem_t matches ..0 run function kandy:tempest/strike
