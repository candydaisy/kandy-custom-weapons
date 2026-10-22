# Advancement reward: a charged, unblocked stiletto hit
advancement revoke @s only kandy:sin/vanity/hit
function kandy:util/tag_victims

# Paradox: each hit adds a stack (max 3) that strikes again when the 3s window closes
execute as @e[tag=kandy.victim] unless score @s chr_pt matches 1.. run scoreboard players set @s chr_pt 60
scoreboard players add @e[tag=kandy.victim] chr_ps 1
scoreboard players set @e[tag=kandy.victim,scores={chr_ps=4..}] chr_ps 3
execute as @e[tag=kandy.victim] at @s run playsound minecraft:block.note_block.hat player @a[distance=..12] ~ ~ ~ 0.6 1.8

# Chrono Stasis: a critical hit freezes the target, once per 10s per target
execute if predicate kandy:chronos_crit as @e[tag=kandy.victim] unless score @s chr_scd matches 1.. at @s run function kandy:sin/vanity/weapon/stasis

tag @e[tag=kandy.victim] remove kandy.victim
