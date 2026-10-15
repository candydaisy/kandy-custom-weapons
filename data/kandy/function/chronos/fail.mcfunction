# The anchor is in another dimension, gone, or now blocked: the timeline snaps
function kandy:chronos/clear_anchor
scoreboard players set @s chr_anc 0
scoreboard players set @s chr_cd 400
playsound minecraft:block.glass.break player @s ~ ~ ~ 1 0.6
title @s actionbar {"text":"The anchor was lost — the timeline snaps","color":"red"}
