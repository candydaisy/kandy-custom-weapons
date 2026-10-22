$bossbar add kandy:hud_$(id)_fl_volley ""
scoreboard players operation #s hud_v = @s kandy.cd.envy
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players operation #m hud_v = @s kandy.cdmax.envy
execute unless score #m hud_v matches 1.. run scoreboard players set #m hud_v 1
scoreboard players operation #bar hud_v = #m hud_v
scoreboard players operation #bar hud_v -= @s kandy.cd.envy
execute if score #bar hud_v matches ..-1 run scoreboard players set #bar hud_v 0
$bossbar set kandy:hud_$(id)_fl_volley color green
$execute store result bossbar kandy:hud_$(id)_fl_volley max run scoreboard players get #m hud_v
$execute store result bossbar kandy:hud_$(id)_fl_volley value run scoreboard players get #bar hud_v
$execute if score @s kandy.cd.envy matches 0 run bossbar set kandy:hud_$(id)_fl_volley name [{"text":"Falconer's Recurve","color":"#f4a259"},{"text":" - Falcon Volley ready","color":"white"}]
$execute if score @s kandy.cd.envy matches 1.. run bossbar set kandy:hud_$(id)_fl_volley name [{"text":"Falconer's Recurve","color":"#f4a259"},{"text":" - Falcon Volley ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$execute if score @s fl_lt matches 1.. if score @s kandy.cd.envy matches 0 run bossbar set kandy:hud_$(id)_fl_volley name [{"text":"Falconer's Recurve","color":"#f4a259"},{"text":" - Locked on | Volley ready","color":"gold"}]
$execute if score @s fl_lt matches 1.. if score @s kandy.cd.envy matches 1.. run bossbar set kandy:hud_$(id)_fl_volley name [{"text":"Falconer's Recurve","color":"#f4a259"},{"text":" - Locked on | Volley ","color":"gold"},{"score":{"name":"#s","objective":"hud_v"},"color":"gold"},{"text":"s","color":"gold"}]
$bossbar set kandy:hud_$(id)_fl_volley players @s
$bossbar set kandy:hud_$(id)_fl_volley visible true
