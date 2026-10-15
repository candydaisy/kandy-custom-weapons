# Run as a mine or dome marker: delete it and its display
scoreboard players operation #id rep_tmp = @s rep_id
execute as @e[type=item_display,tag=kandy.rep_display] if score @s rep_id = #id rep_tmp run kill @s
kill @s
