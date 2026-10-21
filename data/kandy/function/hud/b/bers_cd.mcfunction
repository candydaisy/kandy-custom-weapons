$bossbar add kandy:hud_$(id)_bers_cd ""
scoreboard players operation #s hud_v = @s kandy.ccd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 1200
scoreboard players operation #bar hud_v -= @s kandy.ccd
$bossbar set kandy:hud_$(id)_bers_cd color red
$bossbar set kandy:hud_$(id)_bers_cd max 1200
$execute store result bossbar kandy:hud_$(id)_bers_cd value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_bers_cd name [{"text":"Berserker Token","color":"#d50000"},{"text":" - Frenzy ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_bers_cd players @s
$bossbar set kandy:hud_$(id)_bers_cd visible true
