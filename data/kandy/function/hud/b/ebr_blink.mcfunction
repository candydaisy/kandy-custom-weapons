$bossbar add kandy:hud_$(id)_ebr_blink ""
scoreboard players operation #s hud_v = @s ebr_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 240
scoreboard players operation #bar hud_v -= @s ebr_cd
$bossbar set kandy:hud_$(id)_ebr_blink color purple
$bossbar set kandy:hud_$(id)_ebr_blink max 240
$execute store result bossbar kandy:hud_$(id)_ebr_blink value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_ebr_blink name [{"text":"Enderbrace","color":"#c77dff"},{"text":" - Blink ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_ebr_blink players @s
$bossbar set kandy:hud_$(id)_ebr_blink visible true
