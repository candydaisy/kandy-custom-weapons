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
tag @a remove kandy.lust.w
tag @a remove kandy.lust.wi
tag @a remove kandy.lust.c
tag @a remove kandy.lust.set
tag @a remove kandy.envy.w
tag @a remove kandy.envy.wi
tag @a remove kandy.envy.c
tag @a remove kandy.envy.set
tag @a remove kandy.gluttony.w
tag @a remove kandy.gluttony.wi
tag @a remove kandy.gluttony.c
tag @a remove kandy.gluttony.set
tag @a remove kandy.sloth.w
tag @a remove kandy.sloth.wi
tag @a remove kandy.sloth.c
tag @a remove kandy.sloth.set

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

# Lust: Blood Pact Blade + Hare's Foot
execute as @a if items entity @s weapon.mainhand *[custom_data~{sin:"lust",type:"weapon"}] run tag @s add kandy.lust.w
execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"BloodPact"}] run tag @s add kandy.lust.w
execute as @a if items entity @s container.* *[custom_data~{sin:"lust",type:"weapon"}] run tag @s add kandy.lust.wi
execute as @a if items entity @s container.* *[custom_data~{ability:"BloodPact"}] run tag @s add kandy.lust.wi
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"lust",type:"weapon"}] run tag @s add kandy.lust.wi
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"BloodPact"}] run tag @s add kandy.lust.wi
execute as @a if items entity @s container.* *[custom_data~{sin:"lust",type:"charm"}] run tag @s add kandy.lust.c
execute as @a if items entity @s container.* *[custom_data~{charm:"HaresFoot"}] run tag @s add kandy.lust.c
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"lust",type:"charm"}] run tag @s add kandy.lust.c
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"HaresFoot"}] run tag @s add kandy.lust.c

# Envy: Falconer's Recurve + Watcher's Lens
execute as @a if items entity @s weapon.mainhand *[custom_data~{sin:"envy",type:"weapon"}] run tag @s add kandy.envy.w
execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Falconer"}] run tag @s add kandy.envy.w
execute as @a if items entity @s container.* *[custom_data~{sin:"envy",type:"weapon"}] run tag @s add kandy.envy.wi
execute as @a if items entity @s container.* *[custom_data~{ability:"Falconer"}] run tag @s add kandy.envy.wi
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"envy",type:"weapon"}] run tag @s add kandy.envy.wi
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Falconer"}] run tag @s add kandy.envy.wi
execute as @a if items entity @s container.* *[custom_data~{sin:"envy",type:"charm"}] run tag @s add kandy.envy.c
execute as @a if items entity @s container.* *[custom_data~{charm:"WatchersLens"}] run tag @s add kandy.envy.c
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"envy",type:"charm"}] run tag @s add kandy.envy.c
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"WatchersLens"}] run tag @s add kandy.envy.c

# Gluttony: Dagger of Lingering Souls + Hearthstone
execute as @a if items entity @s weapon.mainhand *[custom_data~{sin:"gluttony",type:"weapon"}] run tag @s add kandy.gluttony.w
execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Echo"}] run tag @s add kandy.gluttony.w
execute as @a if items entity @s container.* *[custom_data~{sin:"gluttony",type:"weapon"}] run tag @s add kandy.gluttony.wi
execute as @a if items entity @s container.* *[custom_data~{ability:"Echo"}] run tag @s add kandy.gluttony.wi
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"gluttony",type:"weapon"}] run tag @s add kandy.gluttony.wi
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Echo"}] run tag @s add kandy.gluttony.wi
execute as @a if items entity @s container.* *[custom_data~{sin:"gluttony",type:"charm"}] run tag @s add kandy.gluttony.c
execute as @a if items entity @s container.* *[custom_data~{charm:"Hearthstone"}] run tag @s add kandy.gluttony.c
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"gluttony",type:"charm"}] run tag @s add kandy.gluttony.c
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"Hearthstone"}] run tag @s add kandy.gluttony.c

# Sloth: Abyssal Bulwark (held in either hand) + Verdant Sprig
execute as @a if items entity @s weapon.* *[custom_data~{sin:"sloth",type:"weapon"}] run tag @s add kandy.sloth.w
execute as @a if items entity @s weapon.* *[custom_data~{ability:"Abyssal"}] run tag @s add kandy.sloth.w
execute as @a if items entity @s container.* *[custom_data~{sin:"sloth",type:"weapon"}] run tag @s add kandy.sloth.wi
execute as @a if items entity @s container.* *[custom_data~{ability:"Abyssal"}] run tag @s add kandy.sloth.wi
tag @a[tag=kandy.sloth.w] add kandy.sloth.wi
execute as @a if items entity @s container.* *[custom_data~{sin:"sloth",type:"charm"}] run tag @s add kandy.sloth.c
execute as @a if items entity @s container.* *[custom_data~{charm:"VerdantSprig"}] run tag @s add kandy.sloth.c
execute as @a if items entity @s weapon.offhand *[custom_data~{sin:"sloth",type:"charm"}] run tag @s add kandy.sloth.c
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"VerdantSprig"}] run tag @s add kandy.sloth.c

# The sins quarrel: carrying charms of two different sins turns every sin charm off
scoreboard players set @a kandy.n 0
scoreboard players add @a[tag=kandy.wrath.c] kandy.n 1
scoreboard players add @a[tag=kandy.pride.c] kandy.n 1
scoreboard players add @a[tag=kandy.greed.c] kandy.n 1
scoreboard players add @a[tag=kandy.lust.c] kandy.n 1
scoreboard players add @a[tag=kandy.envy.c] kandy.n 1
scoreboard players add @a[tag=kandy.gluttony.c] kandy.n 1
scoreboard players add @a[tag=kandy.sloth.c] kandy.n 1
tellraw @a[scores={kandy.n=2..},tag=!kandy.quarrel] {text:"Your sins quarrel: no sin charm works while you carry two different sins.",color:"dark_red"}
tag @a[scores={kandy.n=2..}] add kandy.quarrel
tag @a[scores={kandy.n=..1}] remove kandy.quarrel
tag @a[tag=kandy.quarrel] remove kandy.wrath.c
tag @a[tag=kandy.quarrel] remove kandy.pride.c
tag @a[tag=kandy.quarrel] remove kandy.greed.c
tag @a[tag=kandy.quarrel] remove kandy.lust.c
tag @a[tag=kandy.quarrel] remove kandy.envy.c
tag @a[tag=kandy.quarrel] remove kandy.gluttony.c
tag @a[tag=kandy.quarrel] remove kandy.sloth.c

tag @a[tag=kandy.wrath.w,tag=kandy.wrath.c] add kandy.wrath.set
tag @a[tag=kandy.pride.w,tag=kandy.pride.c] add kandy.pride.set
tag @a[tag=kandy.lust.w,tag=kandy.lust.c] add kandy.lust.set
tag @a[tag=kandy.envy.w,tag=kandy.envy.c] add kandy.envy.set
tag @a[tag=kandy.gluttony.w,tag=kandy.gluttony.c] add kandy.gluttony.set
tag @a[tag=kandy.sloth.w,tag=kandy.sloth.c] add kandy.sloth.set
# Crossbows are often held in the offhand, so Greed's set counts either hand
execute as @a[tag=kandy.greed.c] if items entity @s weapon.* *[custom_data~{sin:"greed",type:"weapon"}] run tag @s add kandy.greed.set
execute as @a[tag=kandy.greed.c] if items entity @s weapon.* *[custom_data~{ability:"Chainwarden"}] run tag @s add kandy.greed.set
