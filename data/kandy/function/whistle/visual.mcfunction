scoreboard players add @a[tag=kandy.main.whistle] whis_cd 0
scoreboard players add @a[tag=kandy.main.whistle] whis_trail 0
execute as @a[tag=kandy.main.whistle] run scoreboard players operation @s whis_cs = @s whis_cd
scoreboard players add @a[tag=kandy.main.whistle] whis_cs 19
scoreboard players operation @a[tag=kandy.main.whistle] whis_cs /= #20 whis_tmp
title @a[tag=kandy.main.whistle,scores={whis_cd=0,whis_trail=0}] actionbar [{"text":"✦ Bloodhound Sonar ✦ ","color":"#1abc9c","bold":true},{"text":"ready","color":"white"},{"text":" — Sound the horn","color":"gray","italic":true}]
title @a[tag=kandy.main.whistle,scores={whis_cd=1..,whis_trail=0}] actionbar [{"text":"✦ Bloodhound Sonar ✦ ","color":"dark_aqua","bold":true},{"score":{"name":"@s","objective":"whis_cs"},"color":"gray"},{"text":"s","color":"gray"}]
title @a[tag=kandy.main.whistle,scores={whis_trail=1..}] actionbar [{"text":"✦ Scent Locked ✦ ","color":"dark_red","bold":true},{"text":"— Follow the blood","color":"red","italic":true}]
