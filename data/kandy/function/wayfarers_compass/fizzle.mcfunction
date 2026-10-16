# Macro: the recall failed; no cost, no cooldown
scoreboard players set @s way_chg 0
$title @s actionbar {"text":"$(why)","color":"gray"}
execute at @s run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 1 0.5
