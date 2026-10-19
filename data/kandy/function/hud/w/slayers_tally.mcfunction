scoreboard players set #vis hud_v 0
execute if entity @s[tag=kandy.charm.slayers_tally] if score @s tly_show matches 1.. if score @s tly_kind matches 1.. run scoreboard players set #vis hud_v 1
$execute if score #vis hud_v matches 0 run bossbar set kandy:hud_$(id)_tly_tally visible false
execute if score #vis hud_v matches 0 run return 0
execute store result storage kandy:hud k int 1 run scoreboard players get @s tly_kind
function kandy:hud/b/tly_tally with storage kandy:hud
