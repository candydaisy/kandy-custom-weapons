kill @e[type=marker,tag=ecl.tracker]
kill @e[type=marker,tag=ecl.vortex]
tag @e[type=arrow] remove ecl.arrow
tag @e[type=arrow] remove ecl.singular
tag @e[type=arrow] remove ecl.checked
scoreboard objectives remove ecl_cd
scoreboard objectives remove ecl_warp
scoreboard objectives remove ecl_sneak
scoreboard objectives remove ecl_id
scoreboard objectives remove ecl_pid
scoreboard objectives remove ecl_life
scoreboard objectives remove ecl_tmp
advancement revoke @a only kandy:hit/eclipse
