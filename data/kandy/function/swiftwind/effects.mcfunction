effect give @a[tag=kandy.inv.swiftwind,scores={sprint=250..}] minecraft:speed 2 0 true

# Reach at 500+, attack speed at 750+, only while Swiftwind is in hand
execute as @a unless entity @s[tag=kandy.main.swiftwind,scores={sprint=500..}] run attribute @s minecraft:entity_interaction_range modifier remove kandy:momentum
execute as @a unless entity @s[tag=kandy.main.swiftwind,scores={sprint=750..}] run attribute @s minecraft:attack_speed modifier remove kandy:momentum
execute as @a[tag=kandy.main.swiftwind,scores={sprint=500..}] run attribute @s minecraft:entity_interaction_range modifier add kandy:momentum 1 add_value
execute as @a[tag=kandy.main.swiftwind,scores={sprint=750..}] run attribute @s minecraft:attack_speed modifier add kandy:momentum 0.3 add_value
