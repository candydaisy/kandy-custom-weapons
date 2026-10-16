# Run as the marker: start the cooldown; Two-way Glass makes them glow too
scoreboard players set @s wat_cd 400
effect give @s minecraft:glowing 3 0 true
playsound minecraft:item.spyglass.stop_using player @s ~ ~ ~ 1 0.6
playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.8 1.4
