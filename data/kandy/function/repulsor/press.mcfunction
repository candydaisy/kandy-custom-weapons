# Run as and at a player on the first tick of a right-click with a Repulsor Mine: deploy it on the ground you're looking at
execute if score @s rep_cd matches 1.. run return run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.6 0.5
scoreboard players set #ok rep_tmp 0
scoreboard players set #fall rep_tmp 0
scoreboard players set #steps rep_tmp 10
execute anchored eyes positioned ^ ^ ^ run function kandy:repulsor/aim
execute if score #ok rep_tmp matches 0 run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.6 0.5
execute if score #ok rep_tmp matches 0 run title @s actionbar {"text":"No ground in reach to place the mine","color":"gray","italic":true}
