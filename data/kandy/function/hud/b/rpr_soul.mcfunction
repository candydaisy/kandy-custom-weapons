$bossbar add kandy:hud_$(id)_rpr_soul ""
scoreboard players operation #s hud_v = @s rpr_t
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
$bossbar set kandy:hud_$(id)_rpr_soul color purple
$bossbar set kandy:hud_$(id)_rpr_soul max 600
$execute store result bossbar kandy:hud_$(id)_rpr_soul value run scoreboard players get @s rpr_t
$bossbar set kandy:hud_$(id)_rpr_soul name [{"text":"Reaper's Knuckle","color":"#6c5b7b"},{"text":" - Souls ","color":"white"},{"score":{"name":"@s","objective":"rpr_s"},"color":"white"},{"text":"/4 | ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_rpr_soul players @s
$bossbar set kandy:hud_$(id)_rpr_soul visible true
