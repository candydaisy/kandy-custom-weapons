$bossbar add kandy:hud_$(id)_void_cloak ""
scoreboard players operation #s hud_v = @s void_cloak_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 100
scoreboard players operation #bar hud_v -= @s void_cloak_cd
$bossbar set kandy:hud_$(id)_void_cloak color purple
$bossbar set kandy:hud_$(id)_void_cloak max 100
$execute store result bossbar kandy:hud_$(id)_void_cloak value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_void_cloak name [{"text":"Void Talisman","color":"#8a4fe0"},{"text":" - Shadow Cloak ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_void_cloak players @s
$bossbar set kandy:hud_$(id)_void_cloak visible true
