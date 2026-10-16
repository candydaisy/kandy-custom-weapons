# Harvested souls fade after 30s; dying drops them all
scoreboard players remove @a[scores={rpr_t=1..}] rpr_t 1
execute as @a[scores={rpr_t=0,rpr_s=1..}] run function kandy:reapers_knuckle/expire
execute as @a[scores={rpr_death=1..}] run function kandy:reapers_knuckle/expire
scoreboard players set @a[scores={rpr_death=1..}] rpr_death 0
