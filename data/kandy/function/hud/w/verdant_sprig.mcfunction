scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.verdant_sprig] if score @s ver_dark matches 600.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_ver_wither visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/ver_wither with storage kandy:hud
