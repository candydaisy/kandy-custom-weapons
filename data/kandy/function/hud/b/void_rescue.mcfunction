$bossbar add kandy:hud_$(id)_void_rescue ""
scoreboard players operation #s hud_v = @s void_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 2400
scoreboard players operation #bar hud_v -= @s void_cd
$bossbar set kandy:hud_$(id)_void_rescue color purple
$bossbar set kandy:hud_$(id)_void_rescue max 2400
$execute store result bossbar kandy:hud_$(id)_void_rescue value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_void_rescue name [{"text":"Void Talisman","color":"#8a4fe0"},{"text":" - Void Rescue ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_void_rescue players @s
$bossbar set kandy:hud_$(id)_void_rescue visible true
