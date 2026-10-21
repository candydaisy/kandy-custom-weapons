# Dive impact: 6 damage (8 from tier 2) to everything within 3 blocks, shoved away; you're rooted
attribute @s minecraft:gravity modifier remove kandy:dragoon_dive
scoreboard players set @s dg_dive 0
scoreboard players set @s dg_st 0
scoreboard players set @s kandy.cd 460
scoreboard players set @s kandy.cdmax 460
tag @s add kandy.dg_lander
execute at @s run tag @e[distance=0.01..3,type=!#kandy:unpullable,tag=!kandy.immune] add kandy.dg_struck
execute if score @s dg_tier matches ..1 as @e[tag=kandy.dg_struck] run damage @s 6 kandy:dragoon_pierce by @p[tag=kandy.dg_lander]
execute if score @s dg_tier matches 2.. as @e[tag=kandy.dg_struck] run damage @s 8 kandy:dragoon_pierce by @p[tag=kandy.dg_lander]
execute if score @s dg_tier matches 3 run effect give @e[tag=kandy.dg_struck] minecraft:slowness 3 0
execute as @e[tag=kandy.dg_struck,type=!player] at @s facing entity @p[tag=kandy.dg_lander] feet rotated ~ 0 if block ^ ^ ^-1.5 #kandy:passable if block ^ ^1 ^-1.5 #kandy:passable run tp @s ^ ^ ^-1.5
effect give @s minecraft:slowness 2 2 true
execute at @s run particle minecraft:explosion ~ ~0.3 ~ 1 0.1 1 0 4
execute at @s run particle minecraft:dragon_breath ~ ~0.3 ~ 2 0.1 2 0.02 40
execute at @s run playsound minecraft:entity.generic.explode player @a[distance=..24] ~ ~ ~ 0.8 1.4

# The Fall: a Dive that hits nothing deals you the fall damage you skipped (double at tier 3)
execute unless entity @e[tag=kandy.dg_struck] run function kandy:sin/pride/weapon/fall

# Ascendant (Phoenix Plume carried): each Dive kill takes 30s off Rebirth's cooldown
execute if entity @s[tag=kandy.pride.set] as @e[tag=kandy.dg_struck,nbt={Health:0.0f}] run scoreboard players remove @p[tag=kandy.dg_lander] kandy.ccd 600
scoreboard players set @s[scores={kandy.ccd=..-1}] kandy.ccd 0

# The sin deepens (spear still in hand): tier 2 after 15 Dives that hit, tier 3 after 10 Dive kills
execute if entity @s[tag=kandy.pride.w] run function kandy:sin/tier
execute if entity @s[tag=kandy.pride.w] if score @s kandy.wt matches 1 if entity @e[tag=kandy.dg_struck] run function kandy:sin/deed {sin:"pride",need:15,what:"Dives that hit",name:"Pride",color:"#9b59ff"}
execute if entity @s[tag=kandy.pride.w] if score @s kandy.wt matches 2 as @e[tag=kandy.dg_struck,nbt={Health:0.0f}] as @p[tag=kandy.dg_lander] run function kandy:sin/deed {sin:"pride",need:10,what:"Dive kills",name:"Pride",color:"#9b59ff"}

tag @e[tag=kandy.dg_struck] remove kandy.dg_struck
tag @s remove kandy.dg_lander
