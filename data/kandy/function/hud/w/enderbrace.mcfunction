scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.enderbrace] if score @s ebr_cd matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_ebr_blink visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/ebr_blink with storage kandy:hud
