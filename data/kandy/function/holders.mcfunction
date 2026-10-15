# Work out once per tick who holds (main hand) or carries (anywhere) each weapon
tag @a remove kandy.main.bloodpact
tag @a remove kandy.inv.bloodpact
tag @a remove kandy.main.swiftwind
tag @a remove kandy.inv.swiftwind
tag @a remove kandy.main.worldbreaker
tag @a remove kandy.inv.worldbreaker
tag @a remove kandy.main.pyroclast
tag @a remove kandy.immune

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"BloodPact"}] run tag @s add kandy.main.bloodpact
execute as @a if items entity @s container.* *[custom_data~{ability:"BloodPact"}] run tag @s add kandy.inv.bloodpact
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"BloodPact"}] run tag @s add kandy.inv.bloodpact

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Momentum"}] run tag @s add kandy.main.swiftwind
execute as @a if items entity @s container.* *[custom_data~{ability:"Momentum"}] run tag @s add kandy.inv.swiftwind
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Momentum"}] run tag @s add kandy.inv.swiftwind

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Gravity"}] run tag @s add kandy.main.worldbreaker
execute as @a if items entity @s container.* *[custom_data~{ability:"Gravity"}] run tag @s add kandy.inv.worldbreaker
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Gravity"}] run tag @s add kandy.inv.worldbreaker

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Pyroclast"}] run tag @s add kandy.main.pyroclast

# Creative/spectator players can't be pulled
tag @a[gamemode=creative] add kandy.immune
tag @a[gamemode=spectator] add kandy.immune
