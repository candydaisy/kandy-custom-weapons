scoreboard players set @s stc_tmp 0
execute store result score @s stc_tmp run random value 1..5
execute if score @s stc_tmp matches 1 run function kandy:stormcaller_coil/struck
