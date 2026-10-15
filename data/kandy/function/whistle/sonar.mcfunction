# Sonar Revelation: run as and at the user
tag @s add whis.user
playsound minecraft:entity.warden.sonic_charge player @a[distance=..32] ~ ~ ~ 1 1.6
particle minecraft:sonic_boom ~ ~1 ~ 0 0 0 0 1
particle minecraft:sculk_soul ~ ~1 ~ 4 0.5 4 0.05 60
particle minecraft:sculk_charge_pop ~ ~1 ~ 6 1 6 0.02 60

# Every other player within 20 blocks (not spectators): strip Invisibility (Void Talisman cloak too),
# Glowing for 5s, and no turning invisible again for 4s
tag @a[distance=..20,tag=!whis.user,gamemode=!spectator] add whis.found
execute as @a[tag=whis.found,tag=kandy.void_cloaked] run function kandy:void_talisman/uncloak
effect clear @a[tag=whis.found] minecraft:invisibility
effect give @a[tag=whis.found] minecraft:glowing 5 0 true
scoreboard players set @a[tag=whis.found] whis_rev 80
execute as @a[tag=whis.found] at @s run particle minecraft:sculk_soul ~ ~1 ~ 0.3 0.6 0.3 0.02 8
execute as @a[tag=whis.found] at @s run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 1 1

# Blood Trail: lock onto the found player with the lowest health (nearest one on a tie)
scoreboard players set #min whis_tmp 1000
execute as @a[tag=whis.found] run scoreboard players operation #min whis_tmp < @s whis_hp
execute as @a[tag=whis.found,sort=nearest] if score @s whis_hp = #min whis_tmp unless entity @a[tag=whis.weak] run tag @s add whis.weak
execute if entity @a[tag=whis.weak] run scoreboard players operation @s whis_prey = @a[tag=whis.weak,limit=1] whis_pid
execute if entity @a[tag=whis.weak] run scoreboard players set @s whis_trail 80

# Pack Rush
effect give @s minecraft:speed 4 1 true

tag @a remove whis.found
tag @a remove whis.weak
tag @s remove whis.user
