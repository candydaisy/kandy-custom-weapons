# Run as the placer (#pid set): remove their mine with the lowest id
scoreboard players set #min rep_tmp 2147483647
execute as @e[type=marker,tag=kandy.rep_mine] if score @s rep_pid = #pid rep_tmp run scoreboard players operation #min rep_tmp < @s rep_id
execute as @e[type=marker,tag=kandy.rep_mine] if score @s rep_pid = #pid rep_tmp if score @s rep_id = #min rep_tmp at @s run function kandy:repulsor/expire
