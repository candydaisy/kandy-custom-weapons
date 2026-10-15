# Run as and at a player who just started sneaking: warp to their nearest flying (or just-landed) Eclipse arrow
tag @s add ecl.warper
execute as @e[type=arrow,tag=ecl.arrow,distance=..64] if function kandy:eclipse/owned_by_warper run tag @s add ecl.warp_target
tag @e[type=arrow,tag=ecl.warp_target,sort=nearest,limit=1] add ecl.chosen
tag @e[type=arrow,tag=ecl.warp_target] remove ecl.warp_target
execute unless entity @e[type=arrow,tag=ecl.chosen] run return run tag @s remove ecl.warper

# Find room to stand at the arrow, backing off along its path if it's stuck in a wall
execute at @e[type=arrow,tag=ecl.chosen] align xyz positioned ~0.5 ~ ~0.5 if function kandy:eclipse/spot_ok run return run function kandy:eclipse/warp_to
execute at @e[type=arrow,tag=ecl.chosen] rotated as @e[type=arrow,tag=ecl.chosen] positioned ^ ^ ^-1 align xyz positioned ~0.5 ~ ~0.5 if function kandy:eclipse/spot_ok run return run function kandy:eclipse/warp_to
execute at @e[type=arrow,tag=ecl.chosen] rotated as @e[type=arrow,tag=ecl.chosen] positioned ^ ^ ^-2 align xyz positioned ~0.5 ~ ~0.5 if function kandy:eclipse/spot_ok run return run function kandy:eclipse/warp_to
execute at @e[type=arrow,tag=ecl.chosen] positioned ~ ~-1 ~ align xyz positioned ~0.5 ~ ~0.5 if function kandy:eclipse/spot_ok run return run function kandy:eclipse/warp_to

# No safe spot: fizzle, no cooldown spent
playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
tag @e[type=arrow,tag=ecl.chosen] remove ecl.chosen
tag @s remove ecl.warper
