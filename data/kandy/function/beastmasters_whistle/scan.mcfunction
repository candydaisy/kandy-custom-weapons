# The pack is rebuilt from scratch; bst_own on a pet is its carrier's bst_id
execute as @e[type=minecraft:wolf,tag=kandy.bst_pack] run attribute @s minecraft:attack_damage modifier remove kandy:bst_pack
tag @e[tag=kandy.bst_pack] remove kandy.bst_pack
scoreboard players reset @e[type=#kandy:beastmasters_whistle_pets] bst_own
execute as @a[tag=kandy.charm.beastmasters_whistle] at @s run function kandy:beastmasters_whistle/claim
execute as @e[type=#kandy:beastmasters_whistle_pets,scores={bst_own=1..}] run function kandy:beastmasters_whistle/mend
