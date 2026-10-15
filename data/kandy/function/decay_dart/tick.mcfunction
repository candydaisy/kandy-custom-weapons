# Trail on flying Decay Darts (tagged once, the tick after they spawn)
execute as @e[type=#minecraft:arrows,tag=!dart.checked] run function kandy:decay_dart/check_arrow
execute as @e[type=#minecraft:arrows,tag=dart.arrow,nbt={inGround:0b}] at @s run particle minecraft:dust{color:[0.15,0.6,0.2],scale:0.8} ~ ~ ~ 0.05 0.05 0.05 0 2

# A totem popped under Necrosis gives weaker protection
execute as @a[scores={dart_totem=1..,dart_nec=1..}] at @s run function kandy:decay_dart/totem
scoreboard players set @a[scores={dart_totem=1..}] dart_totem 0

# Necrosis: any health regained is taken back
execute as @e[scores={dart_nec=1..}] at @s run function kandy:decay_dart/necrosis_tick
scoreboard players remove @e[scores={dart_nec=1..}] dart_nec 1
scoreboard players reset @e[scores={dart_nec=0}] dart_nec
