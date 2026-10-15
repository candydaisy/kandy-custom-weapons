execute as @e[tag=kandy.grav_slam] at @s run function kandy:worldbreaker/slam

# Event Horizon: sneaking with Worldbreaker in hand pulls everything nearby in
effect give @a[tag=kandy.main.worldbreaker,predicate=kandy:sneaking] minecraft:slowness 2 5 true
execute as @a[tag=kandy.main.worldbreaker,predicate=kandy:sneaking] at @s run function kandy:worldbreaker/vortex
