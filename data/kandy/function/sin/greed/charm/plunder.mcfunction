# Run as and at a mob the carrier just killed
execute if entity @s[type=#kandy:bosses] run return 0
function kandy:sin/greed/charm/spoils
# Double Plunder: 25% chance to roll its loot again as if the carrier killed it, so Looting counts
execute store result score #r plc_tmp run random value 1..4
# Compound Interest (Arbalest held): a creature you had Tethered always pays twice
execute if entity @p[tag=kandy.plc_greedy,tag=kandy.greed.set] if entity @s[tag=kandy.cw_tethered] if score @s cw_by = #gid plc_tmp run scoreboard players set #r plc_tmp 1
execute unless score #r plc_tmp matches 1 run return 0
tag @s add kandy.plc_target
execute as @p[tag=kandy.plc_greedy] run loot spawn ~ ~0.5 ~ kill @n[tag=kandy.plc_target]
tag @s remove kandy.plc_target
particle minecraft:wax_on ~ ~0.6 ~ 0.4 0.4 0.4 0 12
playsound minecraft:entity.item.pickup player @a[distance=..16] ~ ~ ~ 0.8 0.7
