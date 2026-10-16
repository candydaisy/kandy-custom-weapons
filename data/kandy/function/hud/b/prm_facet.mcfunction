$bossbar add kandy:hud_$(id)_prm_facet ""
scoreboard players operation #s hud_v = @s prm_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 300
scoreboard players operation #bar hud_v -= @s prm_cd
$bossbar set kandy:hud_$(id)_prm_facet color blue
$bossbar set kandy:hud_$(id)_prm_facet max 300
$execute store result bossbar kandy:hud_$(id)_prm_facet value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_prm_facet name [{"text":"Prism Mirror","color":"#98c1d9"},{"text":" - Glancing Facet ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_prm_facet players @s
$bossbar set kandy:hud_$(id)_prm_facet visible true
