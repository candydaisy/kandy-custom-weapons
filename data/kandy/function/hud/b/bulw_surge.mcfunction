$bossbar add kandy:hud_$(id)_bulw_surge ""
scoreboard players operation #s hud_v = @s kandy.cd.sloth
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players operation #m hud_v = @s kandy.cdmax.sloth
execute unless score #m hud_v matches 1.. run scoreboard players set #m hud_v 1
scoreboard players operation #bar hud_v = #m hud_v
scoreboard players operation #bar hud_v -= @s kandy.cd.sloth
execute if score #bar hud_v matches ..-1 run scoreboard players set #bar hud_v 0
$bossbar set kandy:hud_$(id)_bulw_surge color blue
$execute store result bossbar kandy:hud_$(id)_bulw_surge max run scoreboard players get #m hud_v
$execute store result bossbar kandy:hud_$(id)_bulw_surge value run scoreboard players get #bar hud_v
$execute if score @s kandy.cd.sloth matches 0 run bossbar set kandy:hud_$(id)_bulw_surge name [{"text":"Abyssal Bulwark","color":"#4facfe"},{"text":" - Tidal Surge ready","color":"white"}]
$execute if score @s kandy.cd.sloth matches 1.. run bossbar set kandy:hud_$(id)_bulw_surge name [{"text":"Abyssal Bulwark","color":"#4facfe"},{"text":" - Tidal Surge ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_bulw_surge players @s
$bossbar set kandy:hud_$(id)_bulw_surge visible true
