# Once per tick: who holds (.w, main hand), carries (.wi, anywhere) each sin weapon, carries (.c) its charm, and has both (.set)
# Items forged before the sins revamp still count through their old ability/charm keys (as tier 1)
tag @a remove kandy.wrath.w
tag @a remove kandy.wrath.wi
tag @a remove kandy.wrath.c
tag @a remove kandy.wrath.set

# Wrath: Pyroclast Cleaver + Berserker Token
execute as @a if items entity @s weapon.mainhand *[custom_data~{sin:"wrath",type:"weapon"}] run tag @s add kandy.wrath.w
execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Pyroclast"}] run tag @s add kandy.wrath.w
execute as @a if items entity @s container.* *[custom_data~{sin:"wrath",type:"weapon"}] run tag @s add kandy.wrath.wi
execute as @a if items entity @s container.* *[custom_data~{ability:"Pyroclast"}] run tag @s add kandy.wrath.wi
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"wrath",type:"weapon"}] run tag @s add kandy.wrath.wi
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Pyroclast"}] run tag @s add kandy.wrath.wi
execute as @a if items entity @s container.* *[custom_data~{sin:"wrath",type:"charm"}] run tag @s add kandy.wrath.c
execute as @a if items entity @s container.* *[custom_data~{charm:"Berserker"}] run tag @s add kandy.wrath.c
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"wrath",type:"charm"}] run tag @s add kandy.wrath.c
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"Berserker"}] run tag @s add kandy.wrath.c
tag @a[tag=kandy.wrath.w,tag=kandy.wrath.c] add kandy.wrath.set
