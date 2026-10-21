scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.greed.w] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.greed.wi] if score @s kandy.cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_cw_tether visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/cw_tether with storage kandy:hud

scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.greed.w] run scoreboard players set #vis hud_v 1
execute if entity @s[tag=kandy.greed.wi] if score @s cw_gcd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_cw_grapple visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/cw_grapple with storage kandy:hud
