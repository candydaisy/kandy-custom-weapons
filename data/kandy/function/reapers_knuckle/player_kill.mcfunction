# Advancement reward: the player killed another player, which fills all 4 souls
advancement revoke @s only kandy:reapers_knuckle/player_kill
execute unless entity @s[tag=kandy.charm.reapers_knuckle] run return 0
scoreboard players set @s rpr_s 4
function kandy:reapers_knuckle/harvest
