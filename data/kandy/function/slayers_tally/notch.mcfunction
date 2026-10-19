execute store result score #k tly_tmp run function kandy:slayers_tally/kind
execute if score #k tly_tmp matches 0 run return 0
execute store result storage kandy:tally k.k int 1 run scoreboard players get #k tly_tmp
execute as @p[tag=kandy.tly_slayer] run function kandy:slayers_tally/add with storage kandy:tally k
