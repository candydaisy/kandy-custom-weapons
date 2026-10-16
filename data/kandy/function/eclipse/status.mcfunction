# Run as and at each player carrying the Eclipse Longbow: count warpable arrows, highlight
# the one Shadow Warp would pick (only you see it). The boss bar HUD shows the cooldowns
tag @s add ecl.warper
data modify storage kandy:eclipse me set from entity @s UUID
execute as @e[type=#minecraft:arrows,tag=ecl.arrow,distance=..64] if function kandy:eclipse/owned_by_warper run tag @s add ecl.mine
execute store result score @s ecl_n if entity @e[type=#minecraft:arrows,tag=ecl.mine]
execute if score @s ecl_warp matches 0 as @e[type=#minecraft:arrows,tag=ecl.mine,sort=nearest,limit=1] at @s run particle minecraft:end_rod ~ ~ ~ 0.15 0.15 0.15 0 3 force @a[tag=ecl.warper]
execute if score @s ecl_warp matches 0 as @e[type=#minecraft:arrows,tag=ecl.mine,sort=nearest,limit=1] at @s run particle minecraft:reverse_portal ~ ~ ~ 0.2 0.2 0.2 0.05 4 force @a[tag=ecl.warper]
tag @e[type=#minecraft:arrows,tag=ecl.mine] remove ecl.mine
tag @s remove ecl.warper

