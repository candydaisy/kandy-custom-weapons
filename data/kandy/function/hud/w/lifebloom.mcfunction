scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.lifebloom] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.lifebloom] if score @s lb_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_lb_pulse visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/lb_pulse with storage kandy:hud

scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.main.lifebloom] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.inv.lifebloom] if score @s lb_scd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_lb_sanct visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/lb_sanct with storage kandy:hud
