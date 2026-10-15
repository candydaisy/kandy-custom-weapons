execute store result score @s void_x run data get entity @s Pos[0] 100
execute store result score @s void_y run data get entity @s Pos[1] 100
execute store result score @s void_z run data get entity @s Pos[2] 100
scoreboard players set @s void_dim 0
execute if dimension minecraft:the_nether run scoreboard players set @s void_dim 1
execute if dimension minecraft:the_end run scoreboard players set @s void_dim 2
scoreboard players set @s void_saved 1
