# Each player gets a boss bar per skill: all of the held weapon's bars, plus bars for any
# carried weapon's skills that are recharging
execute as @a unless score @s hud_id matches 1.. store result score @s hud_id run scoreboard players add #next hud_id 1
execute as @a run function kandy:hud/player
