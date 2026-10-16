# Advancement reward: a charged melee hit. At 100% Static it discharges into whatever you hit
advancement revoke @s only kandy:stormcaller_coil/hit
execute unless entity @s[tag=kandy.charm.stormcaller_coil,scores={stc_static=100..}] run return 0
# Our own discharge damage counts as a hit too, so ignore hits made while one is being resolved
execute if entity @s[tag=kandy.stc_busy] run return 0
tag @s add kandy.stc_busy
function kandy:util/tag_victims
execute as @e[tag=kandy.victim] run damage @s 4 kandy:tempest_lightning by @p[tag=kandy.stc_busy]
effect give @e[tag=kandy.victim] minecraft:slowness 1 1
execute as @e[tag=kandy.victim] at @s run particle minecraft:electric_spark ~ ~1 ~ 0.3 0.6 0.3 0.2 25
execute if entity @e[tag=kandy.victim] run scoreboard players set @s stc_static 0
execute if entity @e[tag=kandy.victim] run playsound minecraft:entity.lightning_bolt.impact player @a[distance=..16] ~ ~ ~ 0.8 1.6
tag @e[tag=kandy.victim] remove kandy.victim
tag @s remove kandy.stc_busy
