# Cooldown, with a chime when recall is ready again
execute as @a[tag=kandy.charm.wayfarers_compass,scores={way_cd=1}] at @s run playsound minecraft:block.note_block.chime player @s ~ ~ ~ 1 1.2
scoreboard players remove @a[scores={way_cd=1..}] way_cd 1

# Recalls waiting for the destination chunk to load
execute as @a[scores={way_wait=1..}] at @s run function kandy:wayfarers_compass/pending

# Charging: sneak without moving for 3s
execute as @a[tag=kandy.charm.wayfarers_compass] at @s run function kandy:wayfarers_compass/charge
scoreboard players set @a[tag=!kandy.charm.wayfarers_compass] way_chg 0
