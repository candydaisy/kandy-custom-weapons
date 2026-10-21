# Advancement reward: the player killed something. Kills during Overdrive, cleaver in hand, deepen a tier 2 cleaver
advancement revoke @s only kandy:sin/wrath/kill
execute unless entity @s[tag=kandy.wrath.w] run return 0
execute unless score @s pyro_od matches 1.. run return 0
function kandy:sin/tier
execute if score @s kandy.wt matches 2 run function kandy:sin/wrath/weapon/deed
