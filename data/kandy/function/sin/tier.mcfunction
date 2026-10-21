# Run as a player: kandy.wt = tier of the sin weapon in the main hand, else the offhand (pre-revamp items count as 1)
scoreboard players set @s kandy.wt 1
execute if items entity @s weapon.offhand *[custom_data~{type:"weapon",tier:2}] run scoreboard players set @s kandy.wt 2
execute if items entity @s weapon.offhand *[custom_data~{type:"weapon",tier:3}] run scoreboard players set @s kandy.wt 3
execute if items entity @s weapon.mainhand *[custom_data~{type:"weapon"}] run scoreboard players set @s kandy.wt 1
execute if items entity @s weapon.mainhand *[custom_data~{type:"weapon",tier:2}] run scoreboard players set @s kandy.wt 2
execute if items entity @s weapon.mainhand *[custom_data~{type:"weapon",tier:3}] run scoreboard players set @s kandy.wt 3
