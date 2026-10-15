# Aqua Haste: underwater mining speed is restored to land speed while the charm is carried
execute as @a[tag=!kandy.charm.abyssal_pearl] run attribute @s minecraft:submerged_mining_speed modifier remove kandy:pearl_haste
execute as @a[tag=kandy.charm.abyssal_pearl] run attribute @s minecraft:submerged_mining_speed modifier add kandy:pearl_haste 0.8 add_value

# Deep Sea Preset: buffs only while in water, Night Vision only with your head under
effect give @a[tag=kandy.charm.abyssal_pearl,predicate=kandy:abyssal_pearl_in_water] minecraft:water_breathing 3 0 true
effect give @a[tag=kandy.charm.abyssal_pearl,predicate=kandy:abyssal_pearl_in_water] minecraft:dolphins_grace 3 0 true
execute as @a[tag=kandy.charm.abyssal_pearl] at @s anchored eyes positioned ^ ^ ^ if block ~ ~ ~ minecraft:water run effect give @s minecraft:night_vision 12 0 true

# Bubble Burst cooldown, with a pop when it's ready again
execute as @a[tag=kandy.charm.abyssal_pearl,scores={pearl_cd=1}] at @s run playsound minecraft:block.bubble_column.bubble_pop player @s ~ ~ ~ 1 1.2
scoreboard players remove @a[scores={pearl_cd=1..}] pearl_cd 1
scoreboard players remove @a[scores={pearl_tap=1..}] pearl_tap 1

execute as @a[tag=kandy.charm.abyssal_pearl] run function kandy:abyssal_pearl/input
