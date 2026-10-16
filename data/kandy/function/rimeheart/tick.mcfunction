# Heat-sick: Slowness I in the Nether
execute as @a[tag=kandy.charm.rimeheart] at @s if dimension minecraft:the_nether run effect give @s minecraft:slowness 2 0 true

# Frost Path: every 4 ticks, sneaking over still water freezes it into frosted ice (melts back like Frost Walker)
scoreboard players add #t rime_t 1
execute if score #t rime_t matches 4.. run scoreboard players set #t rime_t 0
execute if score #t rime_t matches 0 as @a[tag=kandy.charm.rimeheart,tag=!kandy.immune] if predicate kandy:sneaking at @s if block ~ ~-1 ~ minecraft:water[level=0] run function kandy:rimeheart/freeze
