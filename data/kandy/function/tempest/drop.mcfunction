# Settle the strike point onto the ground below (up to 30 blocks), then mark it
scoreboard players add #fall tem_tmp 1
execute if score #fall tem_tmp matches ..30 if block ~ ~-1 ~ #kandy:passable positioned ~ ~-1 ~ run return run function kandy:tempest/drop
scoreboard players set #fall tem_tmp 0
execute align y run summon minecraft:marker ~ ~ ~ {Tags:["kandy.tem_strike","kandy.tem_fresh"]}
scoreboard players set @e[tag=kandy.tem_fresh] tem_t 15
scoreboard players operation @e[tag=kandy.tem_fresh] tem_id = @s tem_id
tag @e[tag=kandy.tem_fresh] remove kandy.tem_fresh
