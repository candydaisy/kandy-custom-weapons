execute as @a run attribute @s minecraft:movement_speed modifier remove kandy:chainwarden_drag
execute as @a run attribute @s minecraft:fall_damage_multiplier modifier remove kandy:chainwarden_fall
tag @a remove kandy.cw_nofall
tag @e remove kandy.cw_tethered
tag @e remove kandy.cw_anchor
scoreboard objectives remove cw_cd
scoreboard objectives remove cw_gcd
scoreboard objectives remove cw_tt
scoreboard objectives remove cw_reel
scoreboard objectives remove cw_grp
scoreboard objectives remove cw_by
scoreboard objectives remove cw_fall
scoreboard objectives remove cw_snk
scoreboard objectives remove cw_prev
scoreboard objectives remove cw_tmp
data remove storage kandy:chainwarden owner
data remove storage kandy:chainwarden cmp
advancement revoke @a only kandy:hit/chainwarden
