# Beeps rising in pitch for 1s, then a click when armed
scoreboard players remove @s rep_arm 1
execute if score @s rep_arm matches 15 run playsound minecraft:block.note_block.bit player @a[distance=..10] ~ ~ ~ 0.6 0.9
execute if score @s rep_arm matches 10 run playsound minecraft:block.note_block.bit player @a[distance=..10] ~ ~ ~ 0.6 1.2
execute if score @s rep_arm matches 5 run playsound minecraft:block.note_block.bit player @a[distance=..10] ~ ~ ~ 0.6 1.5
execute if score @s rep_arm matches 0 run playsound minecraft:block.stone_button.click_on player @a[distance=..10] ~ ~ ~ 0.8 1.8
