# Run as a Sloth set holder sneaking still: +1 Pressure every 2s (it doesn't fade while you keep it up)
scoreboard players add @s ver_dw 1
execute if score @s ver_dw matches ..39 run return 0
scoreboard players set @s ver_dw 0
scoreboard players add @s bulw_chg 1
function kandy:sin/sloth/weapon/cap
scoreboard players set @s bulw_decay 200
particle minecraft:bubble_pop ~ ~1 ~ 0.4 0.5 0.4 0.05 8
playsound minecraft:block.conduit.ambient player @s ~ ~ ~ 0.4 1.6
