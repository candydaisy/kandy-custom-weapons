# Frost Nova ready again (kandy.cd.melancholy counts down in sin/tick, right after this)
execute as @a[tag=kandy.melancholy.wi,scores={kandy.cd.melancholy=1}] at @s run playsound minecraft:block.powder_snow.break player @s ~ ~ ~ 0.8 1.4

# Hypothermia wears off 6s after the last stack
scoreboard players remove @e[scores={frost_timer=1..}] frost_timer 1
execute as @e[scores={frost_timer=0,frost_stacks=1..}] run function kandy:sin/melancholy/weapon/thaw

# Frozen Solid: hold mobs in place, thaw when time is up
execute as @e[scores={frost_frozen=1..},type=!player] run data modify entity @s Motion[0] set value 0.0d
execute as @e[scores={frost_frozen=1..},type=!player] run data modify entity @s Motion[2] set value 0.0d
execute as @e[scores={frost_frozen=1}] run function kandy:sin/melancholy/weapon/unfreeze
scoreboard players remove @e[scores={frost_frozen=2..}] frost_frozen 1
scoreboard players remove @e[scores={frost_imm=1..}] frost_imm 1

# Frost Nova water melts back after 4s
scoreboard players remove @e[type=minecraft:marker,tag=kandy.frost_ice,scores={frost_ice=1..}] frost_ice 1
execute as @e[type=minecraft:marker,tag=kandy.frost_ice,scores={frost_ice=..0}] at @s run function kandy:sin/melancholy/weapon/melt

function kandy:sin/melancholy/weapon/visual

# Chill: holding the scythe in powder snow deals an extra 1 freeze damage every second
execute as @a[tag=kandy.melancholy.w] at @s if block ~ ~ ~ minecraft:powder_snow run tag @s add kandy.frost_insnow
execute as @a[tag=kandy.melancholy.w] at @s if block ~ ~1 ~ minecraft:powder_snow run tag @s add kandy.frost_insnow
scoreboard players add @a[tag=kandy.frost_insnow] frost_chill 1
scoreboard players set @a[tag=!kandy.frost_insnow] frost_chill 0
execute as @a[scores={frost_chill=20..}] run damage @s 1 minecraft:freeze
scoreboard players set @a[scores={frost_chill=20..}] frost_chill 0
tag @a remove kandy.frost_insnow
