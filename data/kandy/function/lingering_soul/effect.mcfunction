# Soul Spread: a creature that dies with echoes passes them to the nearest other creature
execute as @e[scores={echo_stacks=1..},nbt={DeathTime:1s}] at @s run function kandy:lingering_soul/spread

execute as @e[scores={echo_timer=0,echo_stacks=1..}] run function kandy:lingering_soul/strike
execute as @e[scores={echo_timer=0,echo_stacks=1..}] run scoreboard players remove @s echo_stacks 1
execute as @e[scores={echo_timer=0,echo_stacks=1..}] run scoreboard players set @s echo_timer 20
execute as @e[scores={echo_timer=0,echo_stacks=0}] run scoreboard players set @s echo_timer -1
