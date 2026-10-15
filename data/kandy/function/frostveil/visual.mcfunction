title @a[tag=kandy.main.frostveil,scores={frost_cd=0}] actionbar [{"text":"✦ Frost Nova Ready ✦ ","color":"aqua","bold":true},{"text":"— Sneak-attack to unleash","color":"dark_aqua","italic":true}]
title @a[tag=kandy.main.frostveil,scores={frost_cd=1..}] actionbar [{"text":"✦ Glacial Edge ✦ ","color":"white","bold":true},{"text":"— The cold gathers again","color":"gray","italic":true}]
execute as @a[tag=kandy.main.frostveil] at @s run particle minecraft:snowflake ~ ~1 ~ 0.3 0.4 0.3 0 1

execute as @e[scores={frost_stacks=1..}] at @s run particle minecraft:snowflake ~ ~1 ~ 0.3 0.5 0.3 0 1
execute as @e[scores={frost_frozen=1..}] at @s run particle minecraft:dust{color:[0.7,0.9,1.0],scale:1.2} ~ ~1 ~ 0.35 0.6 0.35 0 3
execute as @e[scores={frost_frozen=1..}] at @s run particle minecraft:item_snowball ~ ~1.2 ~ 0.3 0.5 0.3 0 1
