# Run as a fresh Ender Pearl while someone is Pearl Locked
tag @s add bola.pseen
data remove storage kandy:bola owner
data modify storage kandy:bola owner set from entity @s Owner
execute as @a[scores={bola_lock=1..}] run function kandy:bola/match_owner
execute unless entity @a[tag=bola.thrower] run return 0
execute at @s run particle minecraft:smoke ~ ~ ~ 0.2 0.2 0.2 0.02 15
execute at @s run playsound minecraft:block.chain.break player @a[distance=..16] ~ ~ ~ 1 1.5
give @a[tag=bola.thrower,gamemode=!creative] minecraft:ender_pearl 1
tag @a remove bola.thrower
kill @s
