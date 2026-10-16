# Gaunt: -2 max health while carried
execute as @a[tag=kandy.charm.predators_fang] run attribute @s minecraft:max_health modifier add kandy:fang_gaunt -2 add_value
execute as @a[tag=!kandy.charm.predators_fang] run attribute @s minecraft:max_health modifier remove kandy:fang_gaunt
