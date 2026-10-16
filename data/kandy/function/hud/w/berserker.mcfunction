scoreboard players set #vis hud_v 0
execute if score @s bers_fr matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_bers_frenzy visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/bers_frenzy with storage kandy:hud

scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.berserker] if score @s bers_cd matches 1.. unless score @s bers_fr matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_bers_cd visible false
execute if score #vis hud_v matches 1 run function kandy:hud/b/bers_cd with storage kandy:hud
