# Fleet Foot and Frail: Jump Boost, and speed/armor modifiers only while carried
effect give @a[tag=kandy.charm.hares_foot] minecraft:jump_boost 2 0 true
execute as @a[tag=kandy.charm.hares_foot,tag=!kandy.hare_mod] run function kandy:hares_foot/apply
execute as @a[tag=kandy.hare_mod,tag=!kandy.charm.hares_foot] run function kandy:hares_foot/remove

# Hop Burst: a fresh Jump press while sprinting
scoreboard players remove @a[scores={hare_cd=1..}] hare_cd 1
execute as @a[tag=kandy.charm.hares_foot] run function kandy:hares_foot/input
scoreboard players remove @a[scores={hare_bt=1..}] hare_bt 1
execute as @a[tag=kandy.hare_burst,scores={hare_bt=0}] run function kandy:hares_foot/end_burst
