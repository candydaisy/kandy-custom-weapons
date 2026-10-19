# Advancement reward: the player reeled in a catch. Carrying the Lure: a bite to eat, and 20% of the time a second catch
advancement revoke @s only kandy:anglers_lure/catch
execute unless entity @s[tag=kandy.charm.anglers_lure] run return 0
# Saturation is instant, so 1 here means 1 tick: +1 food
effect give @s minecraft:saturation 1 0 true
execute store result score #r alr_tmp run random value 1..5
execute unless score #r alr_tmp matches 1 run return 0
# A second roll of the fishing loot table with the same rod, so Luck of the Sea and Luck still count
execute if items entity @s weapon.mainhand minecraft:fishing_rod at @s run loot spawn ~ ~0.5 ~ fish minecraft:gameplay/fishing ~ ~ ~ mainhand
execute unless items entity @s weapon.mainhand minecraft:fishing_rod at @s run loot spawn ~ ~0.5 ~ fish minecraft:gameplay/fishing ~ ~ ~ offhand
execute at @s run particle minecraft:splash ~ ~0.5 ~ 0.4 0.2 0.4 0 20
execute at @s run playsound minecraft:entity.fishing_bobber.splash player @a[distance=..16] ~ ~ ~ 0.8 1.4
