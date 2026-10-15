# Right-click: chr_use is set by the using_item advancement; only the first tick of a press counts
execute as @a[tag=kandy.main.chronos,scores={chr_use=1}] unless score @s chr_held matches 1 at @s run function kandy:chronos/press
scoreboard players add @a chr_use 0
execute as @a run scoreboard players operation @s chr_held = @s chr_use
scoreboard players set @a[scores={chr_use=1..}] chr_use 0

# Dying drops the anchor
execute as @a[scores={chr_death=1..}] run function kandy:chronos/clear_anchor
scoreboard players set @a[scores={chr_death=1..}] chr_anc 0
scoreboard players set @a[scores={chr_death=1..}] chr_death 0

# Anchor window and rewind cooldown
execute as @a[scores={chr_anc=1}] at @s run function kandy:chronos/expire
scoreboard players remove @a[scores={chr_anc=1..}] chr_anc 1
execute as @a[scores={chr_cd=1},tag=kandy.main.chronos] at @s run playsound minecraft:block.amethyst_block.resonate player @s ~ ~ ~ 1 1.8
scoreboard players remove @a[scores={chr_cd=1..}] chr_cd 1
scoreboard players remove @e[type=minecraft:marker,tag=kandy.chr_anchor] chr_anc 1
kill @e[type=minecraft:marker,tag=kandy.chr_anchor,scores={chr_anc=..0}]

# Paradox wounds open when their 3s window closes
scoreboard players remove @e[scores={chr_pt=1..}] chr_pt 1
execute as @e[scores={chr_pt=0,chr_ps=1..}] at @s run function kandy:chronos/paradox
scoreboard players reset @e[scores={chr_pt=0}] chr_pt

# Chrono Stasis
scoreboard players remove @e[scores={chr_st=1..}] chr_st 1
execute as @e[tag=kandy.chr_frozen,scores={chr_st=0}] at @s run function kandy:chronos/unfreeze
scoreboard players remove @e[scores={chr_scd=1..}] chr_scd 1

function kandy:chronos/visual
