# Run as and at a player who just started sneaking: warp to their nearest flying (or just-landed) Eclipse arrow
tag @s add ecl.warper
data modify storage kandy:eclipse me set from entity @s UUID
execute as @e[type=#minecraft:arrows,tag=ecl.arrow,distance=..64] if function kandy:eclipse/owned_by_warper run tag @s add ecl.warp_target
tag @e[type=#minecraft:arrows,tag=ecl.warp_target,sort=nearest,limit=1] add ecl.chosen
tag @e[type=#minecraft:arrows,tag=ecl.warp_target] remove ecl.warp_target
execute unless entity @e[type=#minecraft:arrows,tag=ecl.chosen] if entity @s[tag=kandy.main.eclipse] run function kandy:eclipse/no_target
execute unless entity @e[type=#minecraft:arrows,tag=ecl.chosen] run return run tag @s remove ecl.warper

# Find room to stand at the arrow, backing off along its path if it's stuck in a wall
execute at @e[type=#minecraft:arrows,tag=ecl.chosen] align xyz positioned ~0.5 ~ ~0.5 if function kandy:eclipse/spot_ok run return run function kandy:eclipse/warp_to
execute at @e[type=#minecraft:arrows,tag=ecl.chosen] rotated as @e[type=#minecraft:arrows,tag=ecl.chosen] positioned ^ ^ ^-1 align xyz positioned ~0.5 ~ ~0.5 if function kandy:eclipse/spot_ok run return run function kandy:eclipse/warp_to
execute at @e[type=#minecraft:arrows,tag=ecl.chosen] rotated as @e[type=#minecraft:arrows,tag=ecl.chosen] positioned ^ ^ ^-2 align xyz positioned ~0.5 ~ ~0.5 if function kandy:eclipse/spot_ok run return run function kandy:eclipse/warp_to
execute at @e[type=#minecraft:arrows,tag=ecl.chosen] positioned ~ ~-1 ~ align xyz positioned ~0.5 ~ ~0.5 if function kandy:eclipse/spot_ok run return run function kandy:eclipse/warp_to

# No safe spot: fizzle, no cooldown spent
playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
tag @e[type=#minecraft:arrows,tag=ecl.chosen] remove ecl.chosen
tag @s remove ecl.warper
