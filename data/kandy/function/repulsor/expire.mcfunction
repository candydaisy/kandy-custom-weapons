# Run as and at a mine that ran out of time or was replaced
particle minecraft:poof ~ ~0.2 ~ 0.15 0.05 0.15 0.01 6
playsound minecraft:block.heavy_core.break player @a[distance=..12] ~ ~ ~ 0.6 1.4
function kandy:repulsor/remove
