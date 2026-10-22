# Run as an entity whose Paradox window just closed: the wound opens again
execute if score @s chr_ps matches 1 run damage @s 1.5 kandy:chronos_paradox
execute if score @s chr_ps matches 2 run damage @s 3 kandy:chronos_paradox
execute if score @s chr_ps matches 3.. run damage @s 4.5 kandy:chronos_paradox
particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.5 0.3 0.05 25
particle minecraft:dust{color:[1.0,0.84,0.0],scale:1.2} ~ ~1.2 ~ 0.3 0.4 0.3 0 12
playsound minecraft:block.amethyst_block.chime player @a[distance=..16] ~ ~ ~ 1 0.7
scoreboard players reset @s chr_ps
