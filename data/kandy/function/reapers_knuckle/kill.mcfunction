# Advancement reward: the player killed something. Carrying the Knuckle, that's one more soul (max 4)
advancement revoke @s only kandy:reapers_knuckle/kill
execute unless entity @s[tag=kandy.charm.reapers_knuckle] run return 0
scoreboard players add @s rpr_s 1
scoreboard players set @s[scores={rpr_s=5..}] rpr_s 4
function kandy:reapers_knuckle/harvest
