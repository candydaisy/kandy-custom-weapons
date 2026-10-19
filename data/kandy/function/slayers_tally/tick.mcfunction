scoreboard players remove @a[scores={tly_show=1..}] tly_show 1
# Clean Slate: dying wipes every tally
execute as @a[scores={tly_death=1..}] run function kandy:slayers_tally/wipe
