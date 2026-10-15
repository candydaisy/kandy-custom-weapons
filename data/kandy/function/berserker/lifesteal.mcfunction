# Advancement reward: any charged, unblocked melee hit. Heals only during Frenzy, at most once every 3s
advancement revoke @s only kandy:berserker/lifesteal
execute unless score @s bers_fr matches 1.. run return 0
execute if score @s bers_ls matches 1.. run return 0
scoreboard players set @s bers_ls 60
effect give @s minecraft:instant_health 1 0 true
particle minecraft:heart ~ ~2 ~ 0.3 0.2 0.3 0 3
playsound minecraft:entity.generic.drink player @s ~ ~ ~ 0.6 0.7
