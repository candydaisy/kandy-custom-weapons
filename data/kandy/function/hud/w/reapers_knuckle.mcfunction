scoreboard players set #vis hud_v 0
execute if score @s rpr_t matches 1.. if score @s rpr_s matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_rpr_soul visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/rpr_soul with storage kandy:hud
