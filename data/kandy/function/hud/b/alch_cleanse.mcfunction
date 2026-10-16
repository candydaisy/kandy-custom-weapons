$bossbar add kandy:hud_$(id)_alch_cleanse ""
scoreboard players operation #s hud_v = @s alch_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 300
scoreboard players operation #bar hud_v -= @s alch_cd
$bossbar set kandy:hud_$(id)_alch_cleanse color pink
$bossbar set kandy:hud_$(id)_alch_cleanse max 300
$execute store result bossbar kandy:hud_$(id)_alch_cleanse value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_alch_cleanse name [{"text":"Alchemist Catalyst","color":"#ab47bc"},{"text":" - Cleanse ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_alch_cleanse players @s
$bossbar set kandy:hud_$(id)_alch_cleanse visible true
