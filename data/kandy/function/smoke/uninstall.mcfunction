kill @e[type=marker,tag=smk.tracker]
kill @e[type=marker,tag=smk.cloud]
tag @e[type=snowball] remove smk.proj
tag @e[type=snowball] remove smk.seen
tag @a remove smk.own
tag @a remove smk.thrower
scoreboard objectives remove smk_id
scoreboard objectives remove smk_pid
scoreboard objectives remove smk_life
scoreboard objectives remove smk_tmp
data remove storage kandy:smoke owner
data remove storage kandy:smoke cmp
data remove storage kandy:smoke cloud_owner
