# Run as and at a carrier: every pet they own in this dimension comes to them, sitting ones included
scoreboard players set @s bst_still 0
scoreboard players set #n bst_tmp 0
data modify storage kandy:beast me set from entity @s UUID
execute as @e[type=#kandy:beastmasters_whistle_pets,distance=0..] if function kandy:beastmasters_whistle/mine run function kandy:beastmasters_whistle/come
execute if score #n bst_tmp matches 0 run return run title @s actionbar {"text":"No pets of yours to recall here","color":"gray"}
scoreboard players set @s bst_cd 1200
particle minecraft:note ~ ~2.2 ~ 0.4 0.2 0.4 1 6
playsound minecraft:block.note_block.flute player @a[distance=..24] ~ ~ ~ 1 1.2
playsound minecraft:block.note_block.flute player @a[distance=..24] ~ ~ ~ 1 1.8
