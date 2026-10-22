# Run once per arrow: a full-draw Recurve arrow from a player with a lock starts homing
tag @s add kandy.fl_checked
execute unless data entity @s weapon.components."minecraft:custom_data"{ability:"Falconer"} unless data entity @s weapon.components."minecraft:custom_data"{sin:"envy",type:"weapon"} run return 0
execute unless data entity @s {crit:1b} run return 0
# (execute on owner doesn't resolve arrow owners in 26.3, so compare the Owner UUID directly)
data modify storage kandy:falconer owner set from entity @s Owner
execute as @a[tag=kandy.envy.wi,scores={fl_lt=1..}] run function kandy:sin/envy/weapon/match_owner
execute unless entity @a[tag=kandy.fl_shooter] run return 0
tag @s add kandy.fl_homing
data merge entity @s {damage:1.7d}
scoreboard players operation @s fl_tgt = @a[tag=kandy.fl_shooter,limit=1] fl_lock
# Each homing shot keeps the lock alive for another 8s
scoreboard players set @a[tag=kandy.fl_shooter] fl_lt 160
execute as @a[tag=kandy.fl_shooter] if predicate kandy:sneaking at @s run function kandy:sin/active {sin:"envy"}
tag @a remove kandy.fl_shooter
