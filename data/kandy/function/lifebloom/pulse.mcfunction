# Mending Pulse: other players within 6 blocks heal 2 hearts; the badly hurt also regenerate
execute if score @s lb_cd matches 1.. run return run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.6 0.6
scoreboard players set @s lb_cd 240
effect give @a[distance=0.01..6] minecraft:instant_health 1 0
# shortcut: "below half health" is 10 HP or less, ignoring max health bonuses
effect give @a[distance=0.01..6,scores={hp=..10}] minecraft:regeneration 4 0
# Healer's Oath: your own share is a gentle Regeneration instead
effect give @s minecraft:regeneration 3 0
particle minecraft:heart ~ ~1.2 ~ 2 0.6 2 0 12
particle minecraft:cherry_leaves ~ ~1 ~ 3 0.5 3 0 40
playsound minecraft:block.amethyst_block.resonate player @a[distance=..16] ~ ~ ~ 1 1.6
