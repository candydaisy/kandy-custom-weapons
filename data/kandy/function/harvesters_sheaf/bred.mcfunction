# Advancement reward: the player bred two animals. Carrying the Sheaf: 25% chance of twins
advancement revoke @s only kandy:harvesters_sheaf/bred
execute unless entity @s[tag=kandy.charm.harvesters_sheaf] run return 0
execute store result score #r hvs_tmp run random value 1..4
execute if score #r hvs_tmp matches 1 run scoreboard players add @s hvs_twin 1
