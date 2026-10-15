# Run as and at a tracker whose bola just vanished. The marker trails the bola by a tick,
# so look slightly ahead along its path for the creature it struck (never the thrower)
data remove storage kandy:bola owner
data modify storage kandy:bola owner set from entity @s data.owner
execute as @a run function kandy:bola/match_owner
execute positioned ^ ^ ^0.8 as @e[distance=..2.2,type=!#kandy:unpullable,type=!minecraft:marker,type=!minecraft:snowball,tag=!bola.thrower,tag=!kandy.immune,sort=nearest,limit=1] unless score @s bola_imm matches 1.. at @s run function kandy:bola/snare
tag @a remove bola.thrower
kill @s
