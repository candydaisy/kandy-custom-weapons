# Run as and at a sneaking player: standing on one of your own mines for 1s picks it up
scoreboard players operation #pid rep_tmp = @s rep_pid
execute as @e[type=marker,tag=kandy.rep_mine,distance=..1.5] if score @s rep_pid = #pid rep_tmp run tag @s add kandy.rep_near
execute unless entity @e[type=marker,tag=kandy.rep_near] run return 0
scoreboard players set @s rep_tmp 1
scoreboard players add @s rep_pick 1
execute if score @s rep_pick matches 20.. run function kandy:repulsor/pickup
tag @e[type=marker,tag=kandy.rep_near] remove kandy.rep_near
