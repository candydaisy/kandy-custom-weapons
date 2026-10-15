# A player can only have 2 fields: laying a third removes their oldest
scoreboard players operation #own calt_tmp = @s calt_id
execute as @e[type=marker,tag=calt.field] if score @s calt_id = #own calt_tmp run tag @s add calt.mine
execute store result score #n calt_tmp if entity @e[type=marker,tag=calt.mine]
execute if score #n calt_tmp matches 3.. run function kandy:caltrops/trim_oldest
tag @e[type=marker,tag=calt.mine] remove calt.mine
