# Drop the charm's modifiers as soon as it leaves the inventory
execute as @a[tag=!kandy.charm.zephyr] run attribute @s minecraft:fall_damage_multiplier modifier remove kandy:zephyr
execute as @a[tag=!kandy.charm.zephyr] run attribute @s minecraft:gravity modifier remove kandy:zephyr_glide
tag @a[tag=!kandy.charm.zephyr] remove kandy.zephyr_glided

scoreboard players remove @a[scores={zeph_cd=1..}] zeph_cd 1
execute as @a[tag=kandy.charm.zephyr] at @s run function kandy:zephyr/carrier
