# Fleet Foot and Bared: Jump Boost, and speed/armor modifiers only while carried
effect give @a[tag=kandy.lust.c] minecraft:jump_boost 2 0 true
execute as @a[tag=kandy.lust.c,tag=!kandy.hare_mod] run function kandy:sin/lust/charm/apply
execute as @a[tag=kandy.hare_mod,tag=!kandy.lust.c] run function kandy:sin/lust/charm/remove

# Hop Burst: a fresh Jump press while sprinting
scoreboard players remove @a[scores={hare_cd=1..}] hare_cd 1
execute as @a[tag=kandy.lust.c] run function kandy:sin/lust/charm/input
scoreboard players remove @a[scores={hare_bt=1..}] hare_bt 1
execute as @a[tag=kandy.hare_burst,scores={hare_bt=0}] run function kandy:sin/lust/charm/end_burst
