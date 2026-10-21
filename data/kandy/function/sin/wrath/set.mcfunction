# Advancement reward: the player took damage. Blind Fury (cleaver held + Berserker Token carried): pain feeds +5% Heat
advancement revoke @s only kandy:sin/wrath/hurt
execute unless entity @s[tag=kandy.wrath.set] run return 0
execute unless score @s pyro_od matches 0 run return 0
scoreboard players add @s pyro_heat 5
execute if score @s pyro_heat matches 100.. at @s run function kandy:sin/wrath/weapon/overdrive
