# Farmhand: -1 attack damage while carried
execute as @a[tag=kandy.charm.harvesters_sheaf] run attribute @s minecraft:attack_damage modifier add kandy:sheaf_farmhand -1 add_value
execute as @a[tag=!kandy.charm.harvesters_sheaf] run attribute @s minecraft:attack_damage modifier remove kandy:sheaf_farmhand

# Green Thumb: every 2s, 3 random spots around each carrier get a growth stage (about double the normal rate)
scoreboard players add #t hvs_t 1
execute if score #t hvs_t matches 40.. as @a[tag=kandy.charm.harvesters_sheaf] at @s run function kandy:harvesters_sheaf/thumb
execute if score #t hvs_t matches 40.. run scoreboard players set #t hvs_t 0

# Twin Births: the baby only joins the world after the breeding reward, so look for it a tick later
execute as @a[scores={hvs_twin=1..}] at @s run function kandy:harvesters_sheaf/twins
