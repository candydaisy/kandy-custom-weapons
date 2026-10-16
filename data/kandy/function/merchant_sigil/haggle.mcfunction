# Advancement reward: the player completed a villager trade
advancement revoke @s only kandy:merchant_sigil/trade
execute unless entity @s[tag=kandy.charm.merchant_sigil] run return 0
execute if score @s mer_cd matches 1.. run return 0
experience add @s 3 points
scoreboard players set @s mer_cd 100
playsound minecraft:entity.experience_orb.pickup player @s ~ ~ ~ 0.6 1.4
