# Advancement reward: the player killed a monster. Carrying the Tally, it notches its kind.
# The kill can't be selected any more, so the criterion that fired gives the kind (lowest wins, as in kind)
scoreboard players set #k tly_tmp 10
execute if entity @s[advancements={kandy:slayers_tally/kill={k9=true}}] run scoreboard players set #k tly_tmp 9
execute if entity @s[advancements={kandy:slayers_tally/kill={k8=true}}] run scoreboard players set #k tly_tmp 8
execute if entity @s[advancements={kandy:slayers_tally/kill={k7=true}}] run scoreboard players set #k tly_tmp 7
execute if entity @s[advancements={kandy:slayers_tally/kill={k6=true}}] run scoreboard players set #k tly_tmp 6
execute if entity @s[advancements={kandy:slayers_tally/kill={k5=true}}] run scoreboard players set #k tly_tmp 5
execute if entity @s[advancements={kandy:slayers_tally/kill={k4=true}}] run scoreboard players set #k tly_tmp 4
execute if entity @s[advancements={kandy:slayers_tally/kill={k3=true}}] run scoreboard players set #k tly_tmp 3
execute if entity @s[advancements={kandy:slayers_tally/kill={k2=true}}] run scoreboard players set #k tly_tmp 2
execute if entity @s[advancements={kandy:slayers_tally/kill={k1=true}}] run scoreboard players set #k tly_tmp 1
advancement revoke @s only kandy:slayers_tally/kill
execute unless entity @s[tag=kandy.charm.slayers_tally] run return 0
execute store result storage kandy:tally k.k int 1 run scoreboard players get #k tly_tmp
function kandy:slayers_tally/add with storage kandy:tally k
