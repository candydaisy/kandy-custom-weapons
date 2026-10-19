# Run as and at a breeder whose twin roll hit: the nearest newborn gets a twin
scoreboard players remove @s hvs_twin 1
execute as @e[type=#kandy:harvesters_sheaf_breedable,distance=..12,tag=!kandy.hvs_seen,sort=nearest] if function kandy:harvesters_sheaf/newborn run return run function kandy:harvesters_sheaf/twin
