scoreboard players set #min calt_tmp 999999
execute as @e[type=marker,tag=calt.mine] run scoreboard players operation #min calt_tmp < @s calt_life
execute as @e[type=marker,tag=calt.mine] if score @s calt_life = #min calt_tmp run tag @s add calt.old
kill @e[type=marker,tag=calt.old,limit=1]
tag @e[type=marker,tag=calt.old] remove calt.old
