# Run as the embracer: half a block toward the target while there's room, until within 1.8 blocks
execute at @s if entity @e[tag=kandy.lust_target,distance=..1.8] run return 0
scoreboard players set #moved lust_tmp 0
execute at @s facing entity @e[tag=kandy.lust_target,limit=1] feet positioned ^ ^ ^0.5 if block ~ ~ ~ #kandy:passable if block ~ ~1 ~ #kandy:passable store success score #moved lust_tmp run tp @s ~ ~ ~
execute if score #moved lust_tmp matches 0 run return 0
execute at @s run particle minecraft:dust{color:[1.0,0.31,0.64],scale:0.8} ~ ~1 ~ 0.1 0.2 0.1 0 1
scoreboard players remove #steps lust_tmp 1
execute if score #steps lust_tmp matches 1.. run function kandy:sin/lust/weapon/lunge_step
