scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.lust.c] if score @s hare_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_hare_hop visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/hare_hop with storage kandy:hud
