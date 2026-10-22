scoreboard objectives remove hth_tmp
tag @a remove kandy.hth_warm
advancement revoke @a only kandy:sin/gluttony/ate
advancement revoke @a only kandy:recipes/hearthstone_core
advancement revoke @a only kandy:sin/gluttony/feast
execute as @a run attribute @s minecraft:max_health modifier remove kandy:gluttony_feast
scoreboard objectives remove glut_s
scoreboard objectives remove glut_t
scoreboard objectives remove glut_death
