# Run as and at a player who just blew a goat horn: only the Warhorn (either hand) answers
execute unless entity @s[tag=kandy.hold.warhorn] run return 0
# The game's own horn cooldown is shorter than ours, so the score is the real gate
execute if score @s wh_cd matches 1.. run return 0
scoreboard players set @s wh_cd 1800
execute if predicate kandy:sneaking run function kandy:warhorn/rally
execute unless predicate kandy:sneaking run function kandy:warhorn/war_cry
# The horn carries: nearby monsters speed up and you're easy to find
effect give @e[type=#kandy:monsters,distance=..24] minecraft:speed 8 0
effect give @s minecraft:glowing 8 0
