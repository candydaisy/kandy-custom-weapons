kill @e[type=minecraft:marker,tag=kandy.fl_dir]
tag @e remove kandy.fl_marked
tag @e remove kandy.fl_homing
scoreboard objectives remove fl_use
scoreboard objectives remove fl_eid
scoreboard objectives remove fl_cand
scoreboard objectives remove fl_ct
scoreboard objectives remove fl_lock
scoreboard objectives remove fl_lt
scoreboard objectives remove fl_cd
scoreboard objectives remove fl_tgt
scoreboard objectives remove fl_tmp
data remove storage kandy:falconer owner
data remove storage kandy:falconer cmp
data remove storage kandy:falconer me
advancement revoke @a only kandy:falconer/using
