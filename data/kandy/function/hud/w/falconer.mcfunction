scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.falconer] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.falconer] if score @s fl_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_fl_volley visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/fl_volley with storage kandy:hud
