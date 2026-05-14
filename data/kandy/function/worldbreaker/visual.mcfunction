execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Gravity"}] run title @s actionbar [{"text":"✦ Gravitational Pull ✦ ","color":"gray","bold":true},{"text":"— They cannot escape","color":"dark_gray","italic":true}]
execute as @a[scores={sneak=1}] if items entity @s weapon.mainhand *[custom_data~{ability:"Gravity"}] run title @s actionbar [{"text":"✦ Event Horizon ✦ ","color":"dark_purple","bold":true},{"text":"— Space collapses inward","color":"light_purple","italic":true}]
execute as @a[scores={sneak=1},nbt={OnGround:0b}] if items entity @s weapon.mainhand *[custom_data~{ability:"Gravity"}] run title @s actionbar [{"text":"✦ COLLAPSE ✦ ","color":"red","bold":true},{"text":"— The world falls with them","color":"dark_red","italic":true}]

execute as @a[scores={sneak=1}] if items entity @s weapon.mainhand *[custom_data~{ability:"Gravity"}] at @s run particle minecraft:reverse_portal ~ ~1 ~ 1.5 1.5 1.5 0.1 8 normal
execute as @e[scores={grav_hit=1}] at @s run particle minecraft:explosion_emitter ~ ~ ~ 0 0 0 1 1
execute as @e[scores={grav_pull=1..}] at @s run particle minecraft:falling_dust{block_state:{Name:obsidian}} ~ ~1 ~ 0.3 0.8 0.3 0.05 3

execute as @a[scores={sneak=1}] if items entity @s weapon.mainhand *[custom_data~{ability:"Gravity"}] run playsound minecraft:block.beacon.ambient player @s ~ ~ ~ 0.3 0.8
execute as @a at @s if entity @e[scores={grav_hit=1},distance=..6] run playsound minecraft:block.anvil.land player @a[distance=..10] ~ ~ ~ 1 0.6