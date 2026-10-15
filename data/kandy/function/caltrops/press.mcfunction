# Run as and at a player who just right-clicked the pouch
execute if score @s calt_cd matches 1.. run return run playsound minecraft:block.note_block.bass player @s ~ ~ ~ 0.5 0.6
execute unless score @s calt_id matches 1.. store result score @s calt_id run scoreboard players add #next calt_id 1

# Scatter where you're looking (up to 5 blocks), settled onto the ground
scoreboard players set #steps calt_tmp 10
scoreboard players set #fall calt_tmp 0
execute anchored eyes positioned ^ ^ ^ run function kandy:caltrops/aim

scoreboard players set @s calt_cd 200
execute unless entity @s[gamemode=creative] run item modify entity @s weapon.mainhand {function:"minecraft:set_count",count:-1,add:true}
function kandy:caltrops/trim
