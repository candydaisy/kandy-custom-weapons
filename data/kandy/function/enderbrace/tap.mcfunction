# Second press inside the window blinks, otherwise this press opens the window
execute if score @s ebr_tap matches 1.. if score @s ebr_cd matches 0 at @s run return run function kandy:enderbrace/blink
scoreboard players set @s ebr_tap 7
