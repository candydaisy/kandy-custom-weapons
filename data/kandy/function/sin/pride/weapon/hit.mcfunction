# Advancement reward: the spear hit something. During a held charge it Skewers, otherwise it Punctures
advancement revoke @s only kandy:sin/pride/hit
# Our own Puncture damage counts as a hit too, so ignore hits made while one is being resolved
execute if entity @s[tag=kandy.dg_busy] run return 0
tag @s add kandy.dg_busy
function kandy:sin/tier
function kandy:util/tag_victims

# Above Them: +15% of the spear's damage (+25% at tier 3) to creatures at least 2 blocks below you
execute store result score #py dg_tmp run data get entity @s Pos[1] 10
scoreboard players remove #py dg_tmp 20
execute as @e[tag=kandy.victim] store result score @s dg_tmp run data get entity @s Pos[1] 10
execute if score @s kandy.wt matches ..2 store result storage kandy:sin above.amt float 0.00015 run attribute @s minecraft:attack_damage get 1000
execute if score @s kandy.wt matches 3 store result storage kandy:sin above.amt float 0.00025 run attribute @s minecraft:attack_damage get 1000
execute as @e[tag=kandy.victim] if score @s dg_tmp <= #py dg_tmp at @s run function kandy:sin/pride/weapon/above with storage kandy:sin above
scoreboard players operation #id dg_tmp = @s ecl_pid
execute if score @s dg_use matches 1.. as @e[tag=kandy.victim] run function kandy:sin/pride/weapon/skewer
execute unless score @s dg_use matches 1.. as @e[tag=kandy.victim] at @s run function kandy:sin/pride/weapon/puncture
tag @e[tag=kandy.victim] remove kandy.victim
tag @s remove kandy.dg_busy
