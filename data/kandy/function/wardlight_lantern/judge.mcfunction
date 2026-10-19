# Run as and at a new hostile mob near a carrier. A pack can't see how a mob spawned, so these count as not natural:
# persistent mobs (named or summoned that way), raid mobs, and mobs next to a spawner or trial spawner
tag @s add kandy.wdl_seen
execute if entity @s[nbt={PersistenceRequired:1b}] run return 0
execute if data entity @s RaidId run return 0
execute if function kandy:wardlight_lantern/near_spawner run return 0
particle minecraft:soul_fire_flame ~ ~0.8 ~ 0.3 0.5 0.3 0.02 12
# Dropped out of the world first, so it leaves no loot or experience
tp @s ~ -1000 ~
kill @s
