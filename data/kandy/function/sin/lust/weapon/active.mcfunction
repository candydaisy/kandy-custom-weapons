# Active: Embrace. Lunge at the creature you're looking at, up to 6 blocks (8 from tier 2), for 500 Desire
function kandy:sin/tier
execute unless score @s sprint matches 500.. run return run function kandy:sin/lust/weapon/fizzle
tag @s add kandy.lust_self
scoreboard players set #steps lust_tmp 12
execute if score @s kandy.wt matches 2.. run scoreboard players set #steps lust_tmp 16
execute anchored eyes positioned ^ ^ ^ run function kandy:sin/lust/weapon/seek
execute unless entity @e[tag=kandy.lust_target] run tag @s remove kandy.lust_self
execute unless entity @e[tag=kandy.lust_target] run return run function kandy:sin/lust/weapon/fizzle

# Fever (Hare's Foot carried): an Embrace made at full Desire starts no cooldown
execute unless entity @s[tag=kandy.lust.set,scores={sprint=1000..}] run scoreboard players set @s kandy.cd.lust 240
execute unless entity @s[tag=kandy.lust.set,scores={sprint=1000..}] run scoreboard players set @s kandy.cdmax.lust 240
scoreboard players remove @s sprint 500

playsound minecraft:entity.player.breath player @a[distance=..16] ~ ~ ~ 1 1.4
particle minecraft:dust{color:[1.0,0.31,0.64],scale:1.2} ~ ~1 ~ 0.3 0.5 0.3 0 15
scoreboard players set #steps lust_tmp 18
function kandy:sin/lust/weapon/lunge_step

# The embrace lands if you reached them: 4 damage, Weakness I for 3s at tier 3
execute at @s if entity @e[tag=kandy.lust_target,distance=..2.5] run function kandy:sin/lust/weapon/embrace
tag @e[tag=kandy.lust_target] remove kandy.lust_target
tag @s remove kandy.lust_self
return 1
