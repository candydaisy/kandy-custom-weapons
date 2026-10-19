# Glare: Night Vision doesn't stay on a carrier
effect clear @a[tag=kandy.charm.wardlight_lantern] minecraft:night_vision

# Hallowed Ground: a hostile mob is judged once, on its first tick, if it appears within 16 blocks of a carrier
execute as @a[tag=kandy.charm.wardlight_lantern] at @s as @e[type=#kandy:wardlight_lantern_hostiles,distance=..16,tag=!kandy.wdl_seen] at @s run function kandy:wardlight_lantern/judge
# Every other hostile is marked seen on its first tick too, so mobs that wander in later are left alone
tag @e[type=#kandy:wardlight_lantern_hostiles,tag=!kandy.wdl_seen] add kandy.wdl_seen

# Searing Light: every 2s, undead within 6 blocks take 1 damage and glow
scoreboard players add #t wdl_t 1
execute if score #t wdl_t matches 40.. as @a[tag=kandy.charm.wardlight_lantern] at @s run function kandy:wardlight_lantern/sear
execute if score #t wdl_t matches 40.. run scoreboard players set #t wdl_t 0
