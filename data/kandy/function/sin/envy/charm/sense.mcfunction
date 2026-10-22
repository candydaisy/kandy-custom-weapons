# Run as and at a carrier: mobs (never players) whose attack target is this player glow briefly,
# and a creeper closing in on them clicks a warning only they hear
tag @s add kandy.wat_self
execute as @e[type=!minecraft:player,type=!#kandy:unpullable,distance=..16] if function kandy:sin/envy/charm/targets_me run effect give @s minecraft:glowing 1 0 true
execute as @e[type=minecraft:creeper,distance=..5] if function kandy:sin/envy/charm/targets_me run playsound minecraft:block.lever.click player @a[tag=kandy.wat_self] ~ ~ ~ 1 2
tag @s remove kandy.wat_self
