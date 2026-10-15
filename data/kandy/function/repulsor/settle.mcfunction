# Drop up to 3 blocks onto solid ground; never inside a block, never in lava
execute unless block ~ ~ ~ #kandy:passable run return 0
execute if block ~ ~ ~ minecraft:lava run return 0
scoreboard players add #fall rep_tmp 1
execute if score #fall rep_tmp matches ..3 if block ~ ~-1 ~ #kandy:passable positioned ~ ~-1 ~ run return run function kandy:repulsor/settle
execute if block ~ ~-1 ~ #kandy:passable run return 0
execute align y run function kandy:repulsor/place
