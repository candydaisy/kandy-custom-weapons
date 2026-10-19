# Run as a player: step 0.5 blocks toward kandy.cw_mine while there's room; #steps -1 means arrived or blocked
execute at @s if entity @e[tag=kandy.cw_mine,distance=..2] run return run scoreboard players set #steps cw_tmp -1
scoreboard players set #moved cw_tmp 0
execute at @s facing entity @e[tag=kandy.cw_mine,limit=1] feet positioned ^ ^ ^0.5 if block ~ ~ ~ #kandy:passable if block ~ ~1 ~ #kandy:passable store success score #moved cw_tmp run tp @s ~ ~ ~
execute if score #moved cw_tmp matches 0 run return run scoreboard players set #steps cw_tmp -1
execute at @s run particle minecraft:dust{color:[0.55,0.5,0.45],scale:0.7} ~ ~1 ~ 0.1 0.1 0.1 0 1
scoreboard players remove #steps cw_tmp 1
execute if score #steps cw_tmp matches 1.. run function kandy:chainwarden/pull_self
