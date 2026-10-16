# Fidgeting: -10% attack speed while the whetstone is carried
execute as @a[tag=kandy.charm.tinkers_whetstone,tag=!kandy.tnk_fidget] run function kandy:tinkers_whetstone/fidget_on
execute as @a[tag=kandy.tnk_fidget,tag=!kandy.charm.tinkers_whetstone] run function kandy:tinkers_whetstone/fidget_off

# Field Mending: every 5s, +1 durability on a damaged, breakable main-hand item
scoreboard players add @a[tag=kandy.charm.tinkers_whetstone] tnk_mend 1
scoreboard players set @a[tag=!kandy.charm.tinkers_whetstone] tnk_mend 0
execute as @a[scores={tnk_mend=100..}] if items entity @s weapon.mainhand *[minecraft:damage~{damage:{min:1}},!minecraft:unbreakable] run item modify entity @s weapon.mainhand {function:"minecraft:set_damage",damage:0.0001,add:true}
scoreboard players set @a[scores={tnk_mend=100..}] tnk_mend 0

# Sharpen: timers, and the edge wears off when the 20s run out
execute as @a[scores={tnk_act=1}] run attribute @s minecraft:attack_damage modifier remove kandy:tinker_edge
execute as @a[scores={tnk_act=1}] at @s run playsound minecraft:block.grindstone.use player @s ~ ~ ~ 0.4 0.6
scoreboard players remove @a[scores={tnk_act=1..}] tnk_act 1
execute as @a[scores={tnk_cd=1},tag=kandy.charm.tinkers_whetstone] at @s run playsound minecraft:block.anvil.use player @s ~ ~ ~ 0.3 1.8
scoreboard players remove @a[scores={tnk_cd=1..}] tnk_cd 1
execute as @a[tag=kandy.charm.tinkers_whetstone] run function kandy:tinkers_whetstone/still
scoreboard players set @a[tag=!kandy.charm.tinkers_whetstone] tnk_still 0
