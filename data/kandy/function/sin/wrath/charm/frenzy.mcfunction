# 8s of Frenzy, recharging 60s after it starts
scoreboard players set @s kandy.ccd 1200
scoreboard players set @s bers_fr 160
scoreboard players set @s bers_ls 0
effect give @s minecraft:strength 8 0 true
effect give @s minecraft:speed 8 0 true
effect give @s minecraft:night_vision 8 0 true
playsound minecraft:entity.ender_dragon.growl player @a[distance=..16] ~ ~ ~ 0.8 0.6
playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 1 1.2
particle minecraft:angry_villager ~ ~1 ~ 0.5 0.6 0.5 0 8
particle minecraft:dust{color:[1.0,0.0,0.2],scale:1.5} ~ ~1 ~ 0.6 0.8 0.6 0 40
# Blind Fury (cleaver held too): the Frenzy boils straight into Overdrive
execute if entity @s[tag=kandy.wrath.set] if score @s pyro_od matches 0 run function kandy:sin/wrath/weapon/overdrive
