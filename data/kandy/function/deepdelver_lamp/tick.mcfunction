scoreboard players add @a[tag=kandy.charm.deepdelver_lamp] dlv_cd 0
execute as @a[tag=kandy.charm.deepdelver_lamp,scores={dlv_cd=1}] at @s run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.6 0.7
scoreboard players remove @a[scores={dlv_cd=1..}] dlv_cd 1

# Cave Eyes: below Y 40 in the dark. Night Vision is refreshed to 12s so torches don't make it flicker.
# Lamplight downside: you glow to other players while it's lit
execute as @a[tag=kandy.charm.deepdelver_lamp] if predicate kandy:deepdelver_lamp_dark_deep run effect give @s minecraft:night_vision 12 0 true
execute as @a[tag=kandy.charm.deepdelver_lamp] if predicate kandy:deepdelver_lamp_dark_deep run effect give @s minecraft:glowing 2 0 true

# Ore Ping: sneak without moving for 2s
execute as @a[tag=kandy.charm.deepdelver_lamp,scores={dlv_cd=0}] if predicate kandy:deepdelver_lamp_still_sneak run scoreboard players add @s dlv_still 1
execute as @a[tag=kandy.charm.deepdelver_lamp] unless predicate kandy:deepdelver_lamp_still_sneak run scoreboard players set @s dlv_still 0
scoreboard players set @a[tag=!kandy.charm.deepdelver_lamp] dlv_still 0
execute as @a[scores={dlv_still=40..}] at @s run function kandy:deepdelver_lamp/ping

# Ore outlines fade after 5s
scoreboard players remove @e[type=minecraft:block_display,tag=kandy.dlv_ore] dlv_life 1
kill @e[type=minecraft:block_display,tag=kandy.dlv_ore,scores={dlv_life=..0}]
