# Run as and at a creature carrying the devourer's echoes: all of them go off now, 3 each (4 from tier 2)
scoreboard players operation #d soul_tmp = @s echo_stacks
scoreboard players operation #eaten soul_tmp += @s echo_stacks
execute if score @s echo_tier matches ..1 run scoreboard players operation #d soul_tmp *= #3 soul_tmp
execute if score @s echo_tier matches 2.. run scoreboard players operation #d soul_tmp *= #4 soul_tmp
execute store result storage kandy:soul dv.amt int 1 run scoreboard players get #d soul_tmp
scoreboard players set @s echo_stacks 0
scoreboard players set @s echo_timer -1
function kandy:sin/gluttony/weapon/devour_hit with storage kandy:soul dv
particle minecraft:sculk_soul ~ ~1 ~ 0.3 0.5 0.3 0.05 10
