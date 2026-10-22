# Run as a creature whose echo goes off: 3 armor-piercing damage (4 from tier 2), credited to the echo's owner,
# who pays half a hunger point for it (a whole one at tier 3): Insatiable
scoreboard players operation #owner soul_pid = @s echo_owner
execute as @a if score @s soul_pid = #owner soul_pid run tag @s add kandy.soul_owner
execute if score @s echo_tier matches ..1 if entity @a[tag=kandy.soul_owner] run damage @s 3 kandy:echo by @a[tag=kandy.soul_owner,limit=1]
execute if score @s echo_tier matches ..1 unless entity @a[tag=kandy.soul_owner] run damage @s 3 kandy:echo
execute if score @s echo_tier matches 2.. if entity @a[tag=kandy.soul_owner] run damage @s 4 kandy:echo by @a[tag=kandy.soul_owner,limit=1]
execute if score @s echo_tier matches 2.. unless entity @a[tag=kandy.soul_owner] run damage @s 4 kandy:echo
execute unless score @s echo_tier matches 3.. run effect give @a[tag=kandy.soul_owner] minecraft:hunger 1 19 true
execute if score @s echo_tier matches 3.. run effect give @a[tag=kandy.soul_owner] minecraft:hunger 2 19 true
execute at @s run particle minecraft:large_smoke ~ ~1 ~ 0.2 0.3 0.2 0.02 15
execute at @s run playsound minecraft:particle.soul_escape player @a[distance=..16] ~ ~ ~ 0.6 1
tag @a remove kandy.soul_owner
