# Void Rescue cooldown keeps ticking even if the talisman is put away
scoreboard players add @a[tag=kandy.charm.void_talisman] void_cd 0
execute as @a[tag=kandy.charm.void_talisman,scores={void_cd=1}] at @s run playsound minecraft:block.sculk_catalyst.bloom player @s ~ ~ ~ 1 0.8
scoreboard players remove @a[scores={void_cd=1..}] void_cd 1

# Remember the last safe footing, so a rescue can put you back there
execute as @a[tag=kandy.charm.void_talisman] if predicate kandy:void_talisman_on_ground unless predicate kandy:void_talisman_in_void at @s if block ~ ~ ~ #kandy:passable if block ~ ~1 ~ #kandy:passable unless block ~ ~ ~ minecraft:lava unless block ~ ~1 ~ minecraft:lava run function kandy:void_talisman/save_ground

# Void Rescue
execute as @a[tag=kandy.charm.void_talisman,tag=!kandy.immune,scores={void_cd=0}] if predicate kandy:void_talisman_in_void at @s run function kandy:void_talisman/rescue

# Shadow Cloak: hold sneak in the dark for 2s to turn invisible, it lasts only while you keep holding
scoreboard players add @a[tag=kandy.charm.void_talisman] void_cloak_cd 0
scoreboard players remove @a[scores={void_cloak_cd=1..}] void_cloak_cd 1
# Reset first: a store on a chain of conditions writes nothing when an early one fails,
# which left the cloak stuck on after you stopped sneaking
scoreboard players set @a void_dark 0
execute as @a[tag=kandy.charm.void_talisman] if predicate kandy:sneaking if predicate kandy:void_talisman_dark run scoreboard players set @s void_dark 1
scoreboard players add @a[tag=kandy.charm.void_talisman,scores={void_dark=1,void_cloak_cd=0}] void_cloak 1
execute as @a[scores={void_cloak=1..}] unless entity @s[tag=kandy.charm.void_talisman,scores={void_dark=1,void_cloak_cd=0}] run function kandy:void_talisman/uncloak
execute as @a[scores={void_cloak=40..},tag=!kandy.void_cloaked] unless predicate kandy:void_talisman_invisible at @s run function kandy:void_talisman/cloak
effect give @a[tag=kandy.void_cloaked] minecraft:invisibility 1 0 true
