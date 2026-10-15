execute as @a run attribute @s minecraft:fall_damage_multiplier modifier remove kandy:tempest_surge
tag @a remove kandy.tem_nofall
tag @a remove kandy.tem_busy
kill @e[type=marker,tag=kandy.tem_strike]
scoreboard objectives remove tem_air
data remove storage kandy:tempest me
data remove storage kandy:tempest cmp
scoreboard objectives remove tem_dcd
scoreboard objectives remove tem_scd
scoreboard objectives remove tem_jump
scoreboard objectives remove tem_prev
scoreboard objectives remove tem_fall
scoreboard objectives remove tem_id
scoreboard objectives remove tem_t
scoreboard objectives remove tem_tmp
advancement revoke @a only kandy:hit/tempest
advancement revoke @a only kandy:tempest/throw_hit
