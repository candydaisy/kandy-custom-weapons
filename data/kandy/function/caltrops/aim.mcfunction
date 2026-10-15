# Step along your view until a solid block, or 5 blocks
execute unless block ~ ~ ~ #kandy:passable positioned ^ ^ ^-0.5 run return run function kandy:caltrops/drop
scoreboard players remove #steps calt_tmp 1
execute if score #steps calt_tmp matches ..0 run return run function kandy:caltrops/drop
execute positioned ^ ^ ^0.5 run function kandy:caltrops/aim
