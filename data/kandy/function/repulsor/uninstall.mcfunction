execute as @e[type=marker,tag=kandy.rep_mine] run kill @s
execute as @e[type=marker,tag=kandy.rep_dome] run kill @s
kill @e[type=item_display,tag=kandy.rep_display]
advancement revoke @a only kandy:repulsor/using
data remove storage kandy:repulsor me
data remove storage kandy:repulsor cmp
scoreboard objectives remove rep_use
scoreboard objectives remove rep_held
scoreboard objectives remove rep_cd
scoreboard objectives remove rep_pid
scoreboard objectives remove rep_id
scoreboard objectives remove rep_arm
scoreboard objectives remove rep_life
scoreboard objectives remove rep_pick
scoreboard objectives remove rep_n
scoreboard objectives remove rep_s
scoreboard objectives remove rep_tmp
