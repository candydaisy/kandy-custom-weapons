$bossbar add kandy:hud_$(id)_fl_volley ""
scoreboard players add @s fl_cd 0
scoreboard players operation #s hud_v = @s fl_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 280
scoreboard players operation #bar hud_v -= @s fl_cd
$bossbar set kandy:hud_$(id)_fl_volley color yellow
$bossbar set kandy:hud_$(id)_fl_volley max 280
$execute store result bossbar kandy:hud_$(id)_fl_volley value run scoreboard players get #bar hud_v
$execute if score @s fl_cd matches 0 run bossbar set kandy:hud_$(id)_fl_volley name [{"text":"Falconer's Recurve","color":"#f4a259"},{"text":" - Falcon Volley ready","color":"white"}]
$execute if score @s fl_cd matches 1.. run bossbar set kandy:hud_$(id)_fl_volley name [{"text":"Falconer's Recurve","color":"#f4a259"},{"text":" - Falcon Volley ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$execute if score @s fl_lt matches 1.. if score @s fl_cd matches 0 run bossbar set kandy:hud_$(id)_fl_volley name [{"text":"Falconer's Recurve","color":"#f4a259"},{"text":" - Locked on | Volley ready","color":"gold"}]
$execute if score @s fl_lt matches 1.. if score @s fl_cd matches 1.. run bossbar set kandy:hud_$(id)_fl_volley name [{"text":"Falconer's Recurve","color":"#f4a259"},{"text":" - Locked on | Volley ","color":"gold"},{"score":{"name":"#s","objective":"hud_v"},"color":"gold"},{"text":"s","color":"gold"}]
$bossbar set kandy:hud_$(id)_fl_volley players @s
$bossbar set kandy:hud_$(id)_fl_volley visible true
