# Run as a creature whose echo goes off: 3 armor-piercing damage, credited to the echo's owner,
# who pays half a hunger point for it
scoreboard players operation #owner soul_pid = @s echo_owner
execute as @a if score @s soul_pid = #owner soul_pid run tag @s add kandy.soul_owner
execute if entity @a[tag=kandy.soul_owner] run damage @s 3 kandy:echo by @a[tag=kandy.soul_owner,limit=1]
execute unless entity @a[tag=kandy.soul_owner] run damage @s 3 kandy:echo
effect give @a[tag=kandy.soul_owner] minecraft:hunger 1 19 true
tag @a remove kandy.soul_owner
