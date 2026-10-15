# Step along your view (up to 5 blocks) until a solid block, then settle onto the ground
execute unless block ~ ~ ~ #kandy:passable positioned ^ ^ ^-0.5 run return run function kandy:repulsor/settle
scoreboard players remove #steps rep_tmp 1
execute if score #steps rep_tmp matches ..0 run return 0
execute positioned ^ ^ ^0.5 run function kandy:repulsor/aim
