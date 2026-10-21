# Spoils: an extra orb worth about half of what the mob drops
# shortcut: uses each kind's usual adult drop (no equipment or slime-size bonus); upgrade to a per-mob table if it matters
execute if entity @s[type=#minecraft:villager] run return 0
execute if entity @s[type=minecraft:wandering_trader] run return 0
execute if entity @s[type=minecraft:iron_golem] run return 0
execute if entity @s[type=minecraft:snow_golem] run return 0
execute if entity @s[type=minecraft:ravager] run return run summon minecraft:experience_orb ~ ~0.5 ~ {Value:10s}
execute if entity @s[type=minecraft:piglin_brute] run return run summon minecraft:experience_orb ~ ~0.5 ~ {Value:10s}
execute if entity @s[type=minecraft:blaze] run return run summon minecraft:experience_orb ~ ~0.5 ~ {Value:5s}
execute if entity @s[type=minecraft:guardian] run return run summon minecraft:experience_orb ~ ~0.5 ~ {Value:5s}
execute if entity @s[type=minecraft:evoker] run return run summon minecraft:experience_orb ~ ~0.5 ~ {Value:5s}
execute if entity @s[type=minecraft:breeze] run return run summon minecraft:experience_orb ~ ~0.5 ~ {Value:5s}
execute if entity @s[type=#kandy:monsters] run return run summon minecraft:experience_orb ~ ~0.5 ~ {Value:3s}
summon minecraft:experience_orb ~ ~0.5 ~ {Value:1s}
