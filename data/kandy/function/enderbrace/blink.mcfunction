# Run as and at the player: step up to 10 blocks along the view, never into blocks
scoreboard players set @s ebr_tap 0
scoreboard players set #steps ebr_tmp 20
scoreboard players set #moved ebr_tmp 0
function kandy:enderbrace/step
execute if score #moved ebr_tmp matches 0 run return run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.6 0.6
scoreboard players set @s ebr_cd 240
# Departure (this position) and arrival (where the player is now)
particle minecraft:reverse_portal ~ ~1 ~ 0.3 0.6 0.3 0.1 30
playsound minecraft:entity.enderman.teleport player @a[distance=..16] ~ ~ ~ 0.8 1.2
execute at @s run particle minecraft:portal ~ ~1 ~ 0.3 0.6 0.3 0.5 40
execute at @s run playsound minecraft:entity.enderman.teleport player @a[distance=..16] ~ ~ ~ 0.8 1.4
