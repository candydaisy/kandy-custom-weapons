$bossbar add kandy:hud_$(id)_pyro_fissure ""
scoreboard players add @s pyro_cd 0
scoreboard players operation #s hud_v = @s pyro_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 200
scoreboard players operation #bar hud_v -= @s pyro_cd
$bossbar set kandy:hud_$(id)_pyro_fissure color red
$bossbar set kandy:hud_$(id)_pyro_fissure max 200
$execute store result bossbar kandy:hud_$(id)_pyro_fissure value run scoreboard players get #bar hud_v
$execute if score @s pyro_cd matches 0 run bossbar set kandy:hud_$(id)_pyro_fissure name [{"text":"Pyroclast","color":"#ff5200"},{"text":" - Magma Fissure ready","color":"white"}]
$execute if score @s pyro_cd matches 1.. run bossbar set kandy:hud_$(id)_pyro_fissure name [{"text":"Pyroclast","color":"#ff5200"},{"text":" - Magma Fissure ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_pyro_fissure players @s
$bossbar set kandy:hud_$(id)_pyro_fissure visible true
