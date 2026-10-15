title @a[tag=kandy.main.worldbreaker,predicate=!kandy:sneaking] actionbar [{"text":"✦ Gravitational Pull ✦ ","color":"gray","bold":true},{"text":"— They cannot escape","color":"dark_gray","italic":true}]
title @a[tag=kandy.main.worldbreaker,predicate=kandy:sneaking,nbt={OnGround:1b}] actionbar [{"text":"✦ Event Horizon ✦ ","color":"dark_purple","bold":true},{"text":"— Space collapses inward","color":"light_purple","italic":true}]
title @a[tag=kandy.main.worldbreaker,predicate=kandy:sneaking,nbt={OnGround:0b}] actionbar [{"text":"✦ COLLAPSE ✦ ","color":"red","bold":true},{"text":"— The world falls with them","color":"dark_red","italic":true}]

execute as @a[tag=kandy.main.worldbreaker,predicate=kandy:sneaking] at @s run particle minecraft:reverse_portal ~ ~1 ~ 1.5 1.5 1.5 0.1 8 normal
execute as @e[scores={grav_pull=1..}] at @s run particle minecraft:falling_dust{block_state:{id:obsidian}} ~ ~1 ~ 0.3 0.8 0.3 0.05 3

execute as @a[tag=kandy.main.worldbreaker,predicate=kandy:sneaking] at @s run playsound minecraft:block.beacon.ambient player @s ~ ~ ~ 0.3 0.8
