$bossbar add kandy:hud_$(id)_phx_rebirth ""
scoreboard players operation #s hud_v = @s kandy.ccd.pride
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players operation #m hud_v = @s kandy.ccdmax.pride
execute unless score #m hud_v matches 1.. run scoreboard players set #m hud_v 1
scoreboard players operation #bar hud_v = #m hud_v
scoreboard players operation #bar hud_v -= @s kandy.ccd.pride
execute if score #bar hud_v matches ..-1 run scoreboard players set #bar hud_v 0
$bossbar set kandy:hud_$(id)_phx_rebirth color red
$execute store result bossbar kandy:hud_$(id)_phx_rebirth max run scoreboard players get #m hud_v
$execute store result bossbar kandy:hud_$(id)_phx_rebirth value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_phx_rebirth name [{"text":"Phoenix Plume","color":"#f3722c"},{"text":" - Rebirth ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_phx_rebirth players @s
$bossbar set kandy:hud_$(id)_phx_rebirth visible true
