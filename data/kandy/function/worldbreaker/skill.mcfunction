execute as @e[tag=kandy.grav_slam] at @s run function kandy:worldbreaker/slam

# Event Horizon: start sneaking with World Breaker in hand to pull everything nearby in for 5s (18s cooldown)
scoreboard players remove @a[scores={grav_cd=1..}] grav_cd 1
execute as @a[tag=kandy.main.worldbreaker,scores={grav_cd=1}] at @s run playsound minecraft:block.beacon.power_select player @s ~ ~ ~ 0.4 0.8
execute as @a[tag=kandy.main.worldbreaker] run function kandy:worldbreaker/input
scoreboard players set @a[tag=!kandy.main.worldbreaker] grav_prev 1

# Letting go of Sneak or putting the mace away ends it early
execute as @a[scores={grav_vtx=1..}] unless entity @s[tag=kandy.main.worldbreaker,predicate=kandy:sneaking] run function kandy:worldbreaker/vortex_end
effect give @a[scores={grav_vtx=1..}] minecraft:slowness 1 5 true
execute as @a[scores={grav_vtx=1..}] at @s run function kandy:worldbreaker/vortex
scoreboard players remove @a[scores={grav_vtx=2..}] grav_vtx 1
execute as @a[scores={grav_vtx=1}] run function kandy:worldbreaker/vortex_end
