$bossbar add kandy:hud_$(id)_bers_cd ""
scoreboard players operation #s hud_v = @s kandy.ccd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
# The shared cooldown can come from another sin's item, so the bar uses the length it was started with
scoreboard players operation #m hud_v = @s kandy.ccdmax
execute unless score #m hud_v matches 1.. run scoreboard players set #m hud_v 1
scoreboard players operation #bar hud_v = #m hud_v
scoreboard players operation #bar hud_v -= @s kandy.ccd
execute if score #bar hud_v matches ..-1 run scoreboard players set #bar hud_v 0
$bossbar set kandy:hud_$(id)_bers_cd color red
$execute store result bossbar kandy:hud_$(id)_bers_cd max run scoreboard players get #m hud_v
$execute store result bossbar kandy:hud_$(id)_bers_cd value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_bers_cd name [{"text":"Berserker Token","color":"#d50000"},{"text":" - Frenzy ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_bers_cd players @s
$bossbar set kandy:hud_$(id)_bers_cd visible true
