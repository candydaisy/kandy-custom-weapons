$bossbar add kandy:hud_$(id)_pyro_heat ""
scoreboard players add @s pyro_heat 0
scoreboard players add @s pyro_od 0
scoreboard players add @s pyro_oh 0
scoreboard players operation #o hud_v = @s pyro_od
scoreboard players add #o hud_v 19
scoreboard players operation #o hud_v /= #20 hud_v
scoreboard players operation #h hud_v = @s pyro_oh
scoreboard players add #h hud_v 19
scoreboard players operation #h hud_v /= #20 hud_v
scoreboard players operation #bar hud_v = @s pyro_heat
execute if score @s pyro_od matches 1.. run scoreboard players operation #bar hud_v = @s pyro_od
execute if score @s pyro_od matches 1.. run scoreboard players operation #bar hud_v *= #5 hud_v
execute if score @s pyro_od matches 1.. run scoreboard players operation #bar hud_v /= #6 hud_v
execute if score @s pyro_od matches 0 if score @s pyro_oh matches 1.. run scoreboard players operation #bar hud_v = @s pyro_oh
execute if score @s pyro_od matches 0 if score @s pyro_oh matches 1.. run scoreboard players operation #bar hud_v *= #5 hud_v
execute if score @s pyro_od matches 0 if score @s pyro_oh matches 1.. run scoreboard players operation #bar hud_v /= #4 hud_v
$bossbar set kandy:hud_$(id)_pyro_heat color red
$bossbar set kandy:hud_$(id)_pyro_heat max 100
$execute store result bossbar kandy:hud_$(id)_pyro_heat value run scoreboard players get #bar hud_v
$execute if score @s pyro_od matches 0 if score @s pyro_oh matches 0 run bossbar set kandy:hud_$(id)_pyro_heat name [{"text":"Pyroclast","color":"#ff5200"},{"text":" - Heat ","color":"white"},{"score":{"name":"@s","objective":"pyro_heat"},"color":"white"},{"text":"%","color":"white"}]
$execute if score @s pyro_od matches 1.. run bossbar set kandy:hud_$(id)_pyro_heat name [{"text":"Pyroclast","color":"#ff5200"},{"text":" - OVERDRIVE ","color":"yellow"},{"score":{"name":"#o","objective":"hud_v"},"color":"yellow"},{"text":"s","color":"yellow"}]
$execute if score @s pyro_od matches 0 if score @s pyro_oh matches 1.. run bossbar set kandy:hud_$(id)_pyro_heat name [{"text":"Pyroclast","color":"#ff5200"},{"text":" - Overheated ","color":"gray"},{"score":{"name":"#h","objective":"hud_v"},"color":"gray"},{"text":"s","color":"gray"}]
$bossbar set kandy:hud_$(id)_pyro_heat players @s
$bossbar set kandy:hud_$(id)_pyro_heat visible true
