# Drag marked entities toward the nearest Worldbreaker carrier, stopping at walls
execute as @e[scores={grav_pull=1..}] at @s if entity @p[tag=kandy.inv.worldbreaker,distance=..15] facing entity @p[tag=kandy.inv.worldbreaker,distance=..15] eyes rotated ~ 0 if block ^ ^ ^0.5 #kandy:passable if block ^ ^1 ^0.5 #kandy:passable run tp @s ^ ^ ^0.05
scoreboard players remove @e[scores={grav_pull=1..}] grav_pull 1
