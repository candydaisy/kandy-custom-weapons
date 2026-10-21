# Run as a tethered creature: draw its chain from kandy.cw_holder
tag @s add kandy.cw_draw
scoreboard players set #steps cw_tmp 30
execute at @p[tag=kandy.cw_holder] positioned ~ ~1.2 ~ facing entity @s eyes run function kandy:sin/greed/weapon/draw
tag @s remove kandy.cw_draw
