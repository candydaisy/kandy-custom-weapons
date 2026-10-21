# Rising edge of Sneak
scoreboard players set @s cw_snk 0
execute if predicate kandy:sneaking run scoreboard players set @s cw_snk 1
execute if score @s cw_snk matches 1 unless score @s cw_prev matches 1 at @s run function kandy:sin/greed/weapon/sneak
scoreboard players operation @s cw_prev = @s cw_snk
