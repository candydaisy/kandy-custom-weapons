scoreboard players add @s pyro_heat 0
scoreboard players add @s pyro_od 0
scoreboard players add @s pyro_oh 0
scoreboard players add @s pyro_cd 0
scoreboard players operation #s hud_v = @s pyro_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players operation #o hud_v = @s pyro_od
scoreboard players add #o hud_v 19
scoreboard players operation #o hud_v /= #20 hud_v
scoreboard players operation #h hud_v = @s pyro_oh
scoreboard players add #h hud_v 19
scoreboard players operation #h hud_v /= #20 hud_v
execute if score @s pyro_od matches 1.. run return run function kandy:hud/pyroclast_od with storage kandy:hud
execute if score @s pyro_oh matches 1.. run return run function kandy:hud/pyroclast_oh with storage kandy:hud
$bossbar set kandy:hud_$(id) color red
$bossbar set kandy:hud_$(id) max 100
$execute store result bossbar kandy:hud_$(id) value run scoreboard players get @s pyro_heat
$execute if score @s pyro_cd matches 0 run bossbar set kandy:hud_$(id) name [{"text":"Pyroclast","color":"#ff5200"},{"text":" - Heat ","color":"white"},{"score":{"name":"@s","objective":"pyro_heat"},"color":"white"},{"text":"% | Fissure ready","color":"white"}]
$execute if score @s pyro_cd matches 1.. run bossbar set kandy:hud_$(id) name [{"text":"Pyroclast","color":"#ff5200"},{"text":" - Heat ","color":"white"},{"score":{"name":"@s","objective":"pyro_heat"},"color":"white"},{"text":"% | Fissure ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id) players @s
$bossbar set kandy:hud_$(id) visible true
