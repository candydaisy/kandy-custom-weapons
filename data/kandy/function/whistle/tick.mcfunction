scoreboard players remove @a[scores={whis_cd=1..}] whis_cd 1

# Every player gets a stable id so a Blood Trail remembers its prey
execute as @a unless score @s whis_pid matches 1.. store result score @s whis_pid run scoreboard players add #next whis_pid 1

# A goat horn was sounded: check it was the Bloodhound's Whistle
execute as @a[scores={whis_use=1..}] at @s run function kandy:whistle/used
scoreboard players set @a[scores={whis_use=1..}] whis_use 0

# Revealed players can't turn invisible again for a few seconds
execute as @a[scores={whis_rev=1..}] run function kandy:whistle/reveal_tick
scoreboard players remove @a[scores={whis_rev=1..}] whis_rev 1

# Blood Trail to the weakest player found
execute as @a[scores={whis_trail=1..}] at @s run function kandy:whistle/trail_tick
scoreboard players remove @a[scores={whis_trail=1..}] whis_trail 1

function kandy:whistle/visual
