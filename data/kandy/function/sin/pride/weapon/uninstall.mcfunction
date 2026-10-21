execute as @e[scores={dg_sk=1..}] run attribute @s minecraft:armor modifier remove kandy:skewer
execute as @a run attribute @s minecraft:fall_damage_multiplier modifier remove kandy:dragoon_fall
execute as @a run attribute @s minecraft:gravity modifier remove kandy:dragoon_dive
tag @a remove kandy.dg_nofall
scoreboard objectives remove dg_use
scoreboard objectives remove dg_ps
scoreboard objectives remove dg_pt
scoreboard objectives remove dg_by
scoreboard objectives remove dg_sk
scoreboard objectives remove dg_cd
scoreboard objectives remove dg_st
scoreboard objectives remove dg_lev
scoreboard objectives remove dg_dive
scoreboard objectives remove dg_fall
scoreboard objectives remove dg_jmp
scoreboard objectives remove dg_tmp
advancement revoke @a only kandy:sin/pride/using
advancement revoke @a only kandy:sin/pride/hit
tag @a remove kandy.dg_struck
scoreboard objectives remove dg_y
scoreboard objectives remove dg_tier
# Left over from before the Dive change
scoreboard objectives remove dg_snk
