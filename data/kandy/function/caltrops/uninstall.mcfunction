execute as @e[scores={calt_crip=0..}] run attribute @s minecraft:movement_speed modifier remove kandy:caltrops_cripple
kill @e[type=marker,tag=calt.field]
scoreboard objectives remove calt_use
scoreboard objectives remove calt_held
scoreboard objectives remove calt_cd
scoreboard objectives remove calt_id
scoreboard objectives remove calt_life
scoreboard objectives remove calt_hit
scoreboard objectives remove calt_crip
scoreboard objectives remove calt_bleed
scoreboard objectives remove calt_s
scoreboard objectives remove calt_tmp
advancement revoke @a only kandy:caltrops/using
