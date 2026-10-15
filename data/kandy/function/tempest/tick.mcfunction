scoreboard players add @a[tag=kandy.main.tempest] tem_scd 0
scoreboard players remove @a[scores={tem_dcd=1..}] tem_dcd 1
scoreboard players remove @a[scores={tem_scd=1..}] tem_scd 1
execute as @a[tag=kandy.main.tempest,scores={tem_scd=1}] at @s run playsound minecraft:block.beacon.power_select player @s ~ ~ ~ 0.4 2

# Mark thrown Tempest Pikes so their hits chain and Skyward Wrath can find them
execute as @e[type=trident,tag=!kandy.tem_seen] run function kandy:tempest/tag_proj
execute as @e[type=trident,tag=kandy.tem_proj,nbt={inGround:0b}] at @s run particle minecraft:electric_spark ~ ~ ~ 0.1 0.1 0.1 0.02 2

# Gale Surge: press Jump again while airborne
execute as @a[tag=kandy.main.tempest] run function kandy:tempest/input
scoreboard players set @a[tag=!kandy.main.tempest] tem_prev 1

# No fall damage after a Gale Surge until you land
scoreboard players remove @a[scores={tem_fall=1..}] tem_fall 1
execute as @a[tag=kandy.tem_nofall,scores={tem_fall=..0}] if predicate kandy:tempest_grounded run function kandy:tempest/landed

# Skyward Wrath strikes charging on the ground
execute as @e[type=marker,tag=kandy.tem_strike] at @s run function kandy:tempest/strike_tick

function kandy:tempest/visual
