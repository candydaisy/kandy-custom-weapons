scoreboard players add @a[tag=kandy.inv.frostveil] frost_cd 0
scoreboard players remove @a[scores={frost_cd=1..}] frost_cd 1

# Hypothermia wears off 6s after the last stack
scoreboard players remove @e[scores={frost_timer=1..}] frost_timer 1
execute as @e[scores={frost_timer=0,frost_stacks=1..}] run function kandy:frostveil/thaw

# Frozen Solid: hold mobs in place, thaw when time is up
execute as @e[scores={frost_frozen=1..},type=!player] run data modify entity @s Motion[0] set value 0.0d
execute as @e[scores={frost_frozen=1..},type=!player] run data modify entity @s Motion[2] set value 0.0d
execute as @e[scores={frost_frozen=1}] run function kandy:frostveil/unfreeze
scoreboard players remove @e[scores={frost_frozen=2..}] frost_frozen 1
scoreboard players remove @e[scores={frost_imm=1..}] frost_imm 1

# Frost Nova water melts back after 4s
scoreboard players remove @e[type=minecraft:marker,tag=kandy.frost_ice,scores={frost_ice=1..}] frost_ice 1
execute as @e[type=minecraft:marker,tag=kandy.frost_ice,scores={frost_ice=..0}] at @s run function kandy:frostveil/melt

function kandy:frostveil/visual
