$bossbar add kandy:hud_$(id)_bst_recall ""
scoreboard players operation #s hud_v = @s bst_cd
scoreboard players add #s hud_v 19
scoreboard players operation #s hud_v /= #20 hud_v
scoreboard players set #bar hud_v 1200
scoreboard players operation #bar hud_v -= @s bst_cd
$bossbar set kandy:hud_$(id)_bst_recall color green
$bossbar set kandy:hud_$(id)_bst_recall max 1200
$execute store result bossbar kandy:hud_$(id)_bst_recall value run scoreboard players get #bar hud_v
$bossbar set kandy:hud_$(id)_bst_recall name [{"text":"Beastmaster's Whistle","color":"#74c69d"},{"text":" - Recall ","color":"white"},{"score":{"name":"#s","objective":"hud_v"},"color":"white"},{"text":"s","color":"white"}]
$bossbar set kandy:hud_$(id)_bst_recall players @s
$bossbar set kandy:hud_$(id)_bst_recall visible true
