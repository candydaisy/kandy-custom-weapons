# Run as and at a mine (owner tagged kandy.rep_owner if online)
# Player-placed End Crystals are vaporized without exploding; the End's pillar crystals (ShowBottom) are left alone
execute as @e[type=end_crystal,distance=..6,nbt={ShowBottom:0b}] at @s run particle minecraft:gust ~ ~1 ~ 0.3 0.3 0.3 0 3
kill @e[type=end_crystal,distance=..6,nbt={ShowBottom:0b}]

# 5 blast damage to players near the mine, never the owner. player_explosion has no knockback of its own
execute if entity @a[tag=kandy.rep_owner] as @a[distance=..4,tag=!kandy.rep_owner,tag=!kandy.immune] run damage @s 5 minecraft:player_explosion by @a[tag=kandy.rep_owner,limit=1]
execute unless entity @a[tag=kandy.rep_owner] as @a[distance=..4,tag=!kandy.immune] run damage @s 5 minecraft:explosion
effect give @a[distance=..4,tag=!kandy.rep_owner,tag=!kandy.immune] minecraft:slowness 1 1 true

# The shove: a wind charge fired into the ground under the mine bursts and throws everything nearby outward
summon minecraft:wind_charge ~ ~0.6 ~ {Motion:[0.0d,-1.0d,0.0d]}

particle minecraft:explosion ~ ~0.5 ~ 0 0 0 0 1
particle minecraft:gust ~ ~0.5 ~ 1.5 0.4 1.5 0 6
playsound minecraft:entity.breeze.wind_burst player @a[distance=..24] ~ ~ ~ 1.5 0.8
playsound minecraft:block.heavy_core.break player @a[distance=..24] ~ ~ ~ 1 0.6

# Become a 2.5s deflection dome
scoreboard players operation #id rep_tmp = @s rep_id
execute as @e[type=item_display,tag=kandy.rep_display] if score @s rep_id = #id rep_tmp run kill @s
tag @s remove kandy.rep_mine
tag @s add kandy.rep_dome
scoreboard players set @s rep_life 50
