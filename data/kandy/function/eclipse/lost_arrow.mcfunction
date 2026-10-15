# The Singularity arrow vanished, which means it hit an entity. The marker trails the arrow by a
# tick, so snap to the entity it just struck before opening the vortex
execute at @s if entity @e[tag=ecl.recent,distance=..10] run tp @s @e[tag=ecl.recent,distance=..10,sort=nearest,limit=1]
execute at @s run function kandy:eclipse/collapse
