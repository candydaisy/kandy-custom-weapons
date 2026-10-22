advancement revoke @a only kandy:sin/sloth/block
advancement revoke @a only kandy:sin/sloth/parry
kill @e[type=minecraft:marker,tag=kandy.bulw_dir]
tag @a remove kandy.sloth.w
scoreboard objectives remove bulw_chg
scoreboard objectives remove bulw_decay
scoreboard objectives remove bulw_brace
scoreboard objectives remove bulw_lock
scoreboard objectives remove bulw_pcd
scoreboard objectives remove bulw_scd
scoreboard objectives remove bulw_t
scoreboard objectives remove bulw_root
execute as @a run attribute @s minecraft:movement_speed modifier remove kandy:bulwark_heavier
tag @a remove kandy.bulw_heavy
execute as @e[tag=kandy.bulw_rooted] run function kandy:sin/sloth/weapon/unroot
scoreboard objectives remove bulw_snk
scoreboard objectives remove bulw_jmp
scoreboard objectives remove bulw_tmp
