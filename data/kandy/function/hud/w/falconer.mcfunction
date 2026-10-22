scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.envy.w] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.envy.wi] if score @s kandy.cd.envy matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_fl_volley visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/fl_volley with storage kandy:hud
