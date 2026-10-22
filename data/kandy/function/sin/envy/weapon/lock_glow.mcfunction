scoreboard players operation #t fl_tmp = @s fl_lock
execute as @e[tag=kandy.fl_marked] if score @s fl_eid = #t fl_tmp run function kandy:sin/envy/weapon/glow
