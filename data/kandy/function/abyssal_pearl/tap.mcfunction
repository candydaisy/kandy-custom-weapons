# Second press inside the window bursts, otherwise this press opens the window
execute if score @s pearl_tap matches 1.. if score @s pearl_cd matches 0 if predicate kandy:abyssal_pearl_in_water at @s run return run function kandy:abyssal_pearl/burst
scoreboard players set @s pearl_tap 7
