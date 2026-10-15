execute as @a run attribute @s minecraft:fall_damage_multiplier modifier remove kandy:zephyr
execute as @a run attribute @s minecraft:gravity modifier remove kandy:zephyr_glide
tag @a remove kandy.zephyr_glided
tag @a remove kandy.zephyr_src
scoreboard objectives remove zeph_fall
scoreboard objectives remove zeph_vy
scoreboard objectives remove zeph_cd
