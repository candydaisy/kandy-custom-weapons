# Every player gets a stable id so a cloud knows who threw it
execute as @a unless score @s smk_pid matches 1.. run function kandy:smoke/assign_pid

# New snowballs: pick out Smoke Grenades and send a tracker after them
execute as @e[type=snowball,tag=!smk.seen] run function kandy:smoke/check_proj
execute as @e[type=snowball,tag=smk.proj] at @s run particle minecraft:smoke ~ ~ ~ 0.05 0.05 0.05 0.01 2

execute as @e[type=marker,tag=smk.tracker] run function kandy:smoke/track
execute as @e[type=marker,tag=smk.cloud] at @s run function kandy:smoke/cloud
