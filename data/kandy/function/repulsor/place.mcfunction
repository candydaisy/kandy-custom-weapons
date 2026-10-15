# Run as the player, positioned on the ground where the mine goes
scoreboard players set #ok rep_tmp 1
execute unless score @s rep_pid matches 1.. run function kandy:repulsor/assign_pid
scoreboard players operation #pid rep_tmp = @s rep_pid

# At most 2 mines each: placing a third removes your oldest
scoreboard players set #n rep_tmp 0
execute as @e[type=marker,tag=kandy.rep_mine] if score @s rep_pid = #pid rep_tmp run scoreboard players add #n rep_tmp 1
execute if score #n rep_tmp matches 2.. run function kandy:repulsor/remove_oldest

scoreboard players add #seq rep_tmp 1
summon minecraft:marker ~ ~ ~ {Tags:["kandy.rep_mine","kandy.rep_new"]}
summon minecraft:item_display ~ ~0.12 ~ {Tags:["kandy.rep_display","kandy.rep_new"],item:{id:"minecraft:heavy_core",count:1},transformation:{left_rotation:[0f,0f,0f,1f],right_rotation:[0f,0f,0f,1f],translation:[0f,0f,0f],scale:[0.4f,0.4f,0.4f]}}
scoreboard players operation @e[tag=kandy.rep_new] rep_id = #seq rep_tmp
scoreboard players operation @e[tag=kandy.rep_new] rep_pid = #pid rep_tmp
scoreboard players set @e[type=marker,tag=kandy.rep_new] rep_arm 20
scoreboard players set @e[type=marker,tag=kandy.rep_new] rep_life 2400
data modify entity @e[type=marker,tag=kandy.rep_new,limit=1] data.owner set from entity @s UUID
tag @e[tag=kandy.rep_new] remove kandy.rep_new

execute unless entity @s[gamemode=creative] run item modify entity @s weapon.mainhand {function:"minecraft:set_count",count:-1,add:true}
scoreboard players set @s rep_cd 300
playsound minecraft:block.heavy_core.place player @a[distance=..12] ~ ~ ~ 1 1.2
particle minecraft:small_gust ~ ~0.2 ~ 0.2 0.05 0.2 0 4
