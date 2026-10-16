# Release any chunk still held for a pending recall, then clean up
execute as @a[scores={way_fl=1}] run function kandy:wayfarers_compass/release
scoreboard objectives remove way_chg
scoreboard objectives remove way_cd
scoreboard objectives remove way_lock
scoreboard objectives remove way_wait
scoreboard objectives remove way_fl
scoreboard objectives remove way_forced
scoreboard objectives remove way_px
scoreboard objectives remove way_py
scoreboard objectives remove way_pz
scoreboard objectives remove way_tx
scoreboard objectives remove way_ty
scoreboard objectives remove way_tz
scoreboard objectives remove way_tmp
tag @a remove kandy.way_arrived
data remove storage kandy:wayfarers_compass p
data remove storage kandy:wayfarers_compass r
data remove storage kandy:wayfarers_compass t
advancement revoke @a only kandy:recipes/wayfarers_compass_core
