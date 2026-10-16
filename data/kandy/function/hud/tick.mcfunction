# One private boss bar per player shows the meter of the Kandy weapon they're holding
execute as @a unless score @s hud_id matches 1.. store result score @s hud_id run scoreboard players add #next hud_id 1
execute as @a run function kandy:hud/player
