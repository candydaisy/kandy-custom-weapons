$bossbar add kandy:hud_$(id)_wat_mark ""
scoreboard players operation #s hud_v = @s wat_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 400
scoreboard players operation #bar hud_v -= @s wat_cd
$bossbar set kandy:hud_$(id)_wat_mark color purple
$bossbar set kandy:hud_$(id)_wat_mark max 400
$execute store result bossbar kandy:hud_$(id)_wat_mark value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_wat_mark name [{"text":"Watcher's Lens","color":"#b388eb"},{"text":" - Mark ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_wat_mark players @s
$bossbar set kandy:hud_$(id)_wat_mark visible true
