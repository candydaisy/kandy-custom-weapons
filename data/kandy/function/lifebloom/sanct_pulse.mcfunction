# Once a second: Regeneration II for you and teammates inside (a fresh 3s dose only once the last one is gone,
# since refreshing it every second would stop it from ever healing), Slowness I for monsters
function kandy:team/tag_allies {r:5}
tag @s add kandy.ally
execute as @a[tag=kandy.ally] unless predicate kandy:hearthstone_has_regen run effect give @s minecraft:regeneration 3 1
tag @a remove kandy.ally
effect give @e[type=#kandy:monsters,distance=..5] minecraft:slowness 2 0
particle minecraft:spore_blossom_air ~ ~0.5 ~ 2.5 0.2 2.5 0 30
