# Settle down onto the ground (up to 8 blocks), then lay the field there
scoreboard players add #fall calt_tmp 1
execute if score #fall calt_tmp matches ..8 if block ~ ~-1 ~ #kandy:passable positioned ~ ~-1 ~ run return run function kandy:caltrops/drop
scoreboard players set #fall calt_tmp 0
execute align xyz positioned ~0.5 ~ ~0.5 run function kandy:caltrops/place
