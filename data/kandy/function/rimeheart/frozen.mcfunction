# Advancement reward: took freeze damage. Carrying the Rimeheart, heal it straight back
# (players' freeze ticks can't be edited, so the damage is undone instead of blocked)
advancement revoke @s only kandy:rimeheart/frozen
execute if entity @s[tag=kandy.charm.rimeheart] run effect give @s minecraft:regeneration 1 2 true
execute if entity @s[tag=kandy.charm.rimeheart] at @s run particle minecraft:snowflake ~ ~1 ~ 0.3 0.5 0.3 0.01 4
