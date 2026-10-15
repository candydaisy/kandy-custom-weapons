# Run as and at a smoke cloud every tick
scoreboard players operation #owner smk_tmp = @s smk_pid
execute as @a[distance=..3.5] if score @s smk_pid = #owner smk_tmp run tag @s add smk.own

particle minecraft:campfire_signal_smoke ~ ~1 ~ 1.4 0.8 1.4 0.005 3
particle minecraft:large_smoke ~ ~1 ~ 1.5 0.9 1.5 0.01 8
particle minecraft:squid_ink ~ ~0.8 ~ 1.2 0.6 1.2 0.01 2

# Enemies inside are Blinded; it wears off a second after they step out
effect give @a[distance=..3,tag=!smk.own,gamemode=!creative,gamemode=!spectator] minecraft:blindness 1 0 true
# The thrower's own smoke strips Glowing
effect clear @a[distance=..3,tag=smk.own] minecraft:glowing

# Enemy Ender Pearls flying through the smoke fizzle out (the thrower's own pearls pass)
execute if entity @e[type=ender_pearl,distance=..3] run data modify storage kandy:smoke cloud_owner set from entity @s data.owner
execute as @e[type=ender_pearl,distance=..3] at @s run function kandy:smoke/pearl

tag @a[tag=smk.own] remove smk.own
scoreboard players remove @s smk_life 1
execute if score @s smk_life matches ..0 run kill @s
