# Advancement reward: the player hurt something (not with the pack's own bonus damage, which bypasses cooldown).
# The criterion that fired gives the damage band, in tenths
scoreboard players set #d tly_tmp 25
execute if entity @s[advancements={kandy:slayers_tally/hit={t2=true}}] run scoreboard players set #d tly_tmp 60
execute if entity @s[advancements={kandy:slayers_tally/hit={t3=true}}] run scoreboard players set #d tly_tmp 100
execute if entity @s[advancements={kandy:slayers_tally/hit={t4=true}}] run scoreboard players set #d tly_tmp 140
advancement revoke @s only kandy:slayers_tally/hit
execute unless entity @s[tag=kandy.charm.slayers_tally] run return 0
tag @s add kandy.tly_slayer
function kandy:util/tag_victims
execute as @e[tag=kandy.victim] run function kandy:slayers_tally/bonus
tag @e[tag=kandy.victim] remove kandy.victim
tag @s remove kandy.tly_slayer
