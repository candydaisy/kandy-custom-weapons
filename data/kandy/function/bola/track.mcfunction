# Run as and at a bola's tracker marker: follow the bola; when it's gone, it hit something
scoreboard players operation #id bola_tmp = @s bola_id
execute as @e[type=snowball,tag=bola.proj] if score @s bola_id = #id bola_tmp run tag @s add bola.match
scoreboard players remove @s bola_life 1

execute unless entity @e[type=snowball,tag=bola.match] run return run function kandy:bola/impact
execute if score @s bola_life matches ..0 run kill @e[type=snowball,tag=bola.match]
execute if score @s bola_life matches ..0 run return run kill @s

# Copy position and facing, so impact can look a little ahead along the flight path
tp @s @e[type=snowball,tag=bola.match,limit=1]
execute as @e[type=snowball,tag=bola.match] at @s run particle minecraft:crit ~ ~ ~ 0.1 0.1 0.1 0 2
tag @e[type=snowball,tag=bola.match] remove bola.match
