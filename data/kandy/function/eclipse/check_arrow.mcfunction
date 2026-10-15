# Run once per arrow, the tick after it spawns
tag @s add ecl.checked
execute unless data entity @s weapon.components."minecraft:custom_data"{ability:"Eclipse"} run return 0
tag @s add ecl.arrow
data merge entity @s {PierceLevel:2b,damage:2.3d}

# Full draw (critical arrow) with Singularity ready turns it into a Singularity Arrow
data remove storage kandy:eclipse owner
data modify storage kandy:eclipse owner set from entity @s Owner
execute if data entity @s {crit:1b} as @a[scores={ecl_cd=0}] run function kandy:eclipse/match_shooter
execute if entity @a[tag=ecl.shooter] at @s run function kandy:eclipse/singular_arrow
tag @a remove ecl.shooter
