# Every second: find each carrier's pets, buff the pack, mend the calm ones
scoreboard players add #t bst_t 1
execute if score #t bst_t matches 20.. run function kandy:beastmasters_whistle/scan
execute if score #t bst_t matches 20.. run scoreboard players set #t bst_t 0

# Pack Leader: +3 damage, dropped while the wolf is going after a player
execute as @e[type=minecraft:wolf,tag=kandy.bst_pack] run function kandy:beastmasters_whistle/fangs

# Bonded: a carrier's pet that has just started dying
execute as @e[type=#kandy:beastmasters_whistle_pets,scores={bst_own=1..},nbt={DeathTime:1s}] run function kandy:beastmasters_whistle/bonded

# Recall: sneak still for 1s, 60s cooldown
execute as @a[tag=kandy.charm.beastmasters_whistle,scores={bst_cd=1}] at @s run playsound minecraft:block.note_block.flute player @s ~ ~ ~ 0.6 1.4
scoreboard players remove @a[scores={bst_cd=1..}] bst_cd 1
execute as @a[tag=kandy.charm.beastmasters_whistle] at @s run function kandy:beastmasters_whistle/still
