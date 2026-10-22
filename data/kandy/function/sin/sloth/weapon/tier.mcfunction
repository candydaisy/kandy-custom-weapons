# Run as a player holding the Bulwark: bulw_t = its tier, from whichever hand holds it (pre-revamp shields count as 1)
scoreboard players set @s bulw_t 1
execute if items entity @s weapon.* *[custom_data~{sin:"sloth",type:"weapon",tier:2}] run scoreboard players set @s bulw_t 2
execute if items entity @s weapon.* *[custom_data~{sin:"sloth",type:"weapon",tier:3}] run scoreboard players set @s bulw_t 3
