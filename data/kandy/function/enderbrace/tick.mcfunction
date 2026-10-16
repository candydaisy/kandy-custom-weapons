execute as @a[scores={ebr_cd=1},tag=kandy.charm.enderbrace] at @s run playsound minecraft:entity.enderman.ambient player @s ~ ~ ~ 0.3 1.6
scoreboard players remove @a[scores={ebr_cd=1..}] ebr_cd 1
scoreboard players remove @a[scores={ebr_tap=1..}] ebr_tap 1

# Blink: double-tap Sneak
execute as @a[tag=kandy.charm.enderbrace] run function kandy:enderbrace/input
scoreboard players set @a[tag=!kandy.charm.enderbrace] ebr_prev 1

# Water-shy: 1 damage every 2s in water or rain
execute as @a[tag=kandy.charm.enderbrace] run function kandy:enderbrace/wet
scoreboard players set @a[tag=!kandy.charm.enderbrace] ebr_wet 0
