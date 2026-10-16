# Static: 1% per 0.5 blocks sprinted (50 cm), max 100. Only builds while the coil is carried
scoreboard players add @a[tag=kandy.charm.stormcaller_coil] stc_static 0
scoreboard players add @a[tag=kandy.charm.stormcaller_coil] stc_acc 0
execute as @a[tag=kandy.charm.stormcaller_coil] run scoreboard players operation @s stc_acc += @s stc_cm
execute as @a[tag=kandy.charm.stormcaller_coil] run scoreboard players operation @s stc_tmp = @s stc_acc
execute as @a[tag=kandy.charm.stormcaller_coil] run scoreboard players operation @s stc_tmp /= #50 stc_tmp
execute as @a[tag=kandy.charm.stormcaller_coil] run scoreboard players operation @s stc_static += @s stc_tmp
execute as @a[tag=kandy.charm.stormcaller_coil] run scoreboard players operation @s stc_acc %= #50 stc_tmp
scoreboard players set @a stc_cm 0
scoreboard players set @a[scores={stc_static=101..}] stc_static 100
# Without the coil, Static is gone
scoreboard players set @a[tag=!kandy.charm.stormcaller_coil,scores={stc_static=1..}] stc_static 0

# Standing still drains 2% per second
execute as @a[tag=kandy.charm.stormcaller_coil,scores={stc_static=1..}] if predicate kandy:stormcaller_coil_still run scoreboard players add @s stc_idle 1
execute as @a[tag=kandy.charm.stormcaller_coil] unless predicate kandy:stormcaller_coil_still run scoreboard players set @s stc_idle 0
scoreboard players remove @a[scores={stc_idle=20..}] stc_static 2
scoreboard players set @a[scores={stc_idle=20..}] stc_idle 0
scoreboard players set @a[scores={stc_static=..-1}] stc_static 0

# Charged: a crackle around you while at 100%
execute as @a[tag=kandy.charm.stormcaller_coil,scores={stc_static=100}] at @s run particle minecraft:electric_spark ~ ~1 ~ 0.3 0.5 0.3 0.05 1

# Storm Rider: Speed I in rain under open sky
execute as @a[tag=kandy.charm.stormcaller_coil] if predicate kandy:stormcaller_coil_open_rain run effect give @s minecraft:speed 2 0 true

# Downside: in a thunderstorm under open sky, every 30s there's a 1 in 5 chance of being struck
scoreboard players add @a[tag=kandy.charm.stormcaller_coil] stc_storm 1
execute as @a[tag=kandy.charm.stormcaller_coil,scores={stc_storm=600..}] if predicate kandy:stormcaller_coil_open_thunder at @s run function kandy:stormcaller_coil/storm_roll
scoreboard players set @a[scores={stc_storm=600..}] stc_storm 0
