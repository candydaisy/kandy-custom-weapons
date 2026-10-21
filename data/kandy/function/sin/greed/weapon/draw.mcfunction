# Chain links from the player toward the tethered creature, one per 0.8 blocks
particle minecraft:dust{color:[0.55,0.5,0.45],scale:0.7} ~ ~ ~ 0 0 0 0 1
scoreboard players remove #steps cw_tmp 1
execute if score #steps cw_tmp matches 1.. unless entity @e[tag=kandy.cw_draw,distance=..1.5] positioned ^ ^ ^0.8 run function kandy:sin/greed/weapon/draw
