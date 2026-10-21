# Once per tick: who holds (.w, main hand), carries (.wi, anywhere) each sin weapon, carries (.c) its charm, and has both (.set)
# Items forged before the sins revamp still count through their old ability/charm keys (as tier 1)
tag @a remove kandy.wrath.w
tag @a remove kandy.wrath.wi
tag @a remove kandy.wrath.c
tag @a remove kandy.wrath.set
tag @a remove kandy.pride.w
tag @a remove kandy.pride.wi
tag @a remove kandy.pride.c
tag @a remove kandy.pride.set
tag @a remove kandy.greed.w
tag @a remove kandy.greed.wi
tag @a remove kandy.greed.c
tag @a remove kandy.greed.set
tag @a remove kandy.greed.t3

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

# Pride: Dragoon's Wyrmspear + Phoenix Plume
execute as @a if items entity @s weapon.mainhand *[custom_data~{sin:"pride",type:"weapon"}] run tag @s add kandy.pride.w
execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Dragoon"}] run tag @s add kandy.pride.w
execute as @a if items entity @s container.* *[custom_data~{sin:"pride",type:"weapon"}] run tag @s add kandy.pride.wi
execute as @a if items entity @s container.* *[custom_data~{ability:"Dragoon"}] run tag @s add kandy.pride.wi
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"pride",type:"weapon"}] run tag @s add kandy.pride.wi
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Dragoon"}] run tag @s add kandy.pride.wi
execute as @a if items entity @s container.* *[custom_data~{sin:"pride",type:"charm"}] run tag @s add kandy.pride.c
execute as @a if items entity @s container.* *[custom_data~{charm:"PhoenixPlume"}] run tag @s add kandy.pride.c
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"pride",type:"charm"}] run tag @s add kandy.pride.c
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"PhoenixPlume"}] run tag @s add kandy.pride.c

# Greed: Chainwarden Arbalest + Plunderer's Coin (.t3: carrying a tier 3 arbalest, which deepens Gilded Weight)
execute as @a if items entity @s weapon.mainhand *[custom_data~{sin:"greed",type:"weapon"}] run tag @s add kandy.greed.w
execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Chainwarden"}] run tag @s add kandy.greed.w
execute as @a if items entity @s container.* *[custom_data~{sin:"greed",type:"weapon"}] run tag @s add kandy.greed.wi
execute as @a if items entity @s container.* *[custom_data~{ability:"Chainwarden"}] run tag @s add kandy.greed.wi
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"greed",type:"weapon"}] run tag @s add kandy.greed.wi
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Chainwarden"}] run tag @s add kandy.greed.wi
execute as @a if items entity @s container.* *[custom_data~{sin:"greed",type:"weapon",tier:3}] run tag @s add kandy.greed.t3
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"greed",type:"weapon",tier:3}] run tag @s add kandy.greed.t3
execute as @a if items entity @s container.* *[custom_data~{sin:"greed",type:"charm"}] run tag @s add kandy.greed.c
execute as @a if items entity @s container.* *[custom_data~{charm:"PlunderersCoin"}] run tag @s add kandy.greed.c
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"greed",type:"charm"}] run tag @s add kandy.greed.c
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"PlunderersCoin"}] run tag @s add kandy.greed.c

# The sins quarrel: carrying charms of two different sins turns every sin charm off
scoreboard players set @a kandy.n 0
scoreboard players add @a[tag=kandy.wrath.c] kandy.n 1
scoreboard players add @a[tag=kandy.pride.c] kandy.n 1
scoreboard players add @a[tag=kandy.greed.c] kandy.n 1
tellraw @a[scores={kandy.n=2..},tag=!kandy.quarrel] {text:"Your sins quarrel: no sin charm works while you carry two different sins.",color:"dark_red"}
tag @a[scores={kandy.n=2..}] add kandy.quarrel
tag @a[scores={kandy.n=..1}] remove kandy.quarrel
tag @a[tag=kandy.quarrel] remove kandy.wrath.c
tag @a[tag=kandy.quarrel] remove kandy.pride.c
tag @a[tag=kandy.quarrel] remove kandy.greed.c

tag @a[tag=kandy.wrath.w,tag=kandy.wrath.c] add kandy.wrath.set
tag @a[tag=kandy.pride.w,tag=kandy.pride.c] add kandy.pride.set
# Crossbows are often held in the offhand, so Greed's set counts either hand
execute as @a[tag=kandy.greed.c] if items entity @s weapon.* *[custom_data~{sin:"greed",type:"weapon"}] run tag @s add kandy.greed.set
execute as @a[tag=kandy.greed.c] if items entity @s weapon.* *[custom_data~{ability:"Chainwarden"}] run tag @s add kandy.greed.set
