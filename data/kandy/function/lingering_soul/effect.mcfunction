execute as @e[scores={echo_timer=0,echo_stacks=1..}] run damage @s 5 minecraft:sonic_boom
execute as @e[scores={echo_timer=0,echo_stacks=1..}] run scoreboard players remove @s echo_stacks 1
execute as @e[scores={echo_timer=0,echo_stacks=1..}] run scoreboard players set @s echo_timer 20
execute as @e[scores={echo_timer=0,echo_stacks=0}] run scoreboard players set @s echo_timer -1