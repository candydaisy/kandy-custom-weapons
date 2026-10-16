execute as @a run attribute @s minecraft:max_absorption modifier remove kandy:reapers_cap
execute as @a run attribute @s minecraft:max_health modifier remove kandy:reapers_soul
scoreboard objectives remove rpr_s
scoreboard objectives remove rpr_t
scoreboard objectives remove rpr_death
advancement revoke @a only kandy:reapers_knuckle/kill
advancement revoke @a only kandy:reapers_knuckle/player_kill
advancement revoke @a only kandy:reapers_knuckle/undead_hit
