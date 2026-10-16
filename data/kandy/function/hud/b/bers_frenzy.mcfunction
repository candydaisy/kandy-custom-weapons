$bossbar add kandy:hud_$(id)_bers_frenzy ""
scoreboard players operation #s hud_v = @s bers_fr
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
$bossbar set kandy:hud_$(id)_bers_frenzy color red
$bossbar set kandy:hud_$(id)_bers_frenzy max 160
$execute store result bossbar kandy:hud_$(id)_bers_frenzy value run scoreboard players get @s bers_fr
$bossbar set kandy:hud_$(id)_bers_frenzy name [{"text":"Berserker Token","color":"#d50000"},{"text":" - FRENZY ","color":"red"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_bers_frenzy players @s
$bossbar set kandy:hud_$(id)_bers_frenzy visible true
