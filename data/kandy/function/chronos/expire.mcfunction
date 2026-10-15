# The 6s anchor window ran out without a rewind
function kandy:chronos/clear_anchor
scoreboard players set @s chr_cd 400
playsound minecraft:block.amethyst_block.break player @s ~ ~ ~ 0.8 1.2
