# Run as a player holding the cleaver: 6s of Overdrive, 8s from tier 2. Tier 3 is remembered for the Overheat at the end
function kandy:sin/tier
scoreboard players set @s pyro_heat 100
scoreboard players set @s pyro_od 120
execute if score @s kandy.wt matches 2.. run scoreboard players set @s pyro_od 160
execute if score @s kandy.wt matches 3 run tag @s add kandy.wrath.t3
playsound minecraft:entity.blaze.shoot player @a[distance=..16] ~ ~ ~ 1 0.6
playsound minecraft:item.firecharge.use player @a[distance=..16] ~ ~ ~ 1 0.5
particle minecraft:lava ~ ~1 ~ 0.6 0.6 0.6 0 25
particle minecraft:flame ~ ~1 ~ 0.4 0.8 0.4 0.1 40
execute if score @s kandy.wt matches 1 run function kandy:sin/wrath/weapon/deed
