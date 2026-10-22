kill @e[type=minecraft:marker,tag=kandy.fl_dir]
tag @e remove kandy.fl_marked
tag @e remove kandy.fl_homing
tag @e remove kandy.fl_locked
scoreboard objectives remove fl_use
scoreboard objectives remove fl_eid
scoreboard objectives remove fl_cand
scoreboard objectives remove fl_ct
scoreboard objectives remove fl_lock
scoreboard objectives remove fl_lt
scoreboard objectives remove fl_cd
scoreboard objectives remove fl_tgt
scoreboard objectives remove fl_tmp
scoreboard objectives remove envy_tmp
data remove storage kandy:falconer owner
data remove storage kandy:falconer cmp
data remove storage kandy:falconer me
data remove storage kandy:envy fx
advancement revoke @a only kandy:sin/envy/using
advancement revoke @a only kandy:sin/envy/hit
advancement revoke @a only kandy:sin/envy/kill
