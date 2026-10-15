# Thermal Immunity: Fire Resistance while carried
effect give @a[tag=kandy.charm.molten_core] minecraft:fire_resistance 2 0 true

# Thermal Surge: lava turns into power. Regeneration is only reapplied once it runs out,
# because refreshing it every tick would stop it from ever healing
execute as @a[tag=kandy.charm.molten_core] at @s if block ~ ~ ~ minecraft:lava run effect give @s minecraft:speed 1 1 true
execute as @a[tag=kandy.charm.molten_core] at @s if block ~ ~ ~ minecraft:lava unless predicate kandy:molten_core_has_regen run effect give @s minecraft:regeneration 3 0 true
execute as @a[tag=kandy.charm.molten_core] at @s if block ~ ~ ~ minecraft:lava run particle minecraft:flame ~ ~0.5 ~ 0.3 0.3 0.3 0.02 1

# Cinder Ward: fireballs fizzle and flaming arrows are snuffed within 3 blocks
execute as @a[tag=kandy.charm.molten_core] at @s run function kandy:molten_core/ward

scoreboard players remove @a[scores={molt_cd=1..}] molt_cd 1
