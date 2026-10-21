$bossbar add kandy:hud_$(id)_pyro_fissure ""
scoreboard players operation #s hud_v = @s kandy.cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
# The shared cooldown can come from another sin's item, so the bar uses the length it was started with
scoreboard players operation #m hud_v = @s kandy.cdmax
execute unless score #m hud_v matches 1.. run scoreboard players set #m hud_v 1
scoreboard players operation #bar hud_v = #m hud_v
scoreboard players operation #bar hud_v -= @s kandy.cd
execute if score #bar hud_v matches ..-1 run scoreboard players set #bar hud_v 0
$bossbar set kandy:hud_$(id)_pyro_fissure color red
$execute store result bossbar kandy:hud_$(id)_pyro_fissure max run scoreboard players get #m hud_v
$execute store result bossbar kandy:hud_$(id)_pyro_fissure value run scoreboard players get #bar hud_v
$execute if score @s kandy.cd matches 0 run bossbar set kandy:hud_$(id)_pyro_fissure name [{"text":"Pyroclast","color":"#ff5200"},{"text":" - Magma Fissure ready","color":"white"}]
$execute if score @s kandy.cd matches 1.. run bossbar set kandy:hud_$(id)_pyro_fissure name [{"text":"Pyroclast","color":"#ff5200"},{"text":" - Magma Fissure ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_pyro_fissure players @s
$bossbar set kandy:hud_$(id)_pyro_fissure visible true
