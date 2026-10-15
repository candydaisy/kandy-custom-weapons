# Run as and at each player carrying the charm
scoreboard players add @s zeph_cd 0

# Featherweight: no fall damage
attribute @s minecraft:fall_damage_multiplier modifier add kandy:zephyr -1 add_multiplied_total

# Aerial Glide: sneaking while falling drops gravity to slow-falling levels (only on the way down, so it can't boost jumps)
execute store result score @s zeph_vy run data get entity @s Motion[1] 100
execute if predicate kandy:zephyr_glide if score @s zeph_vy matches ..-1 run function kandy:zephyr/glide
execute unless predicate kandy:zephyr_glide run attribute @s minecraft:gravity modifier remove kandy:zephyr_glide
execute if predicate kandy:zephyr_glide if score @s zeph_vy matches 0.. run attribute @s minecraft:gravity modifier remove kandy:zephyr_glide

# Kinetic Shockwave: landing after a real 12+ block fall (gliding down doesn't count)
execute if predicate kandy:zephyr_grounded if score @s zeph_fall matches 12.. if score @s zeph_cd matches 0 unless entity @s[tag=kandy.zephyr_glided] run function kandy:zephyr/shockwave
execute if predicate kandy:zephyr_grounded run tag @s remove kandy.zephyr_glided
execute if predicate kandy:zephyr_grounded run scoreboard players set @s zeph_fall 0
execute unless predicate kandy:zephyr_grounded store result score @s zeph_fall run data get entity @s fall_distance
