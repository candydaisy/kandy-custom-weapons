# Give every player scores to compare against
scoreboard players add @a bers_fr 0

# Dying ends the Frenzy without the crash
scoreboard players set @a[scores={bers_death=1..}] bers_fr 0
scoreboard players set @a[scores={bers_death=1..}] bers_death 0

# Unlock the Frenzy Core recipe the first time anyone drops to 2 hearts
recipe give @a[scores={bers_hp=..4}] kandy:berserker_core

# Battle Frenzy: carried charm, 4 hearts or less, recharged
execute as @a[tag=kandy.wrath.c,scores={kandy.ccd=0,bers_hp=..8},gamemode=!spectator] at @s run function kandy:sin/wrath/charm/frenzy

# Frenzy runs out: Adrenaline Crash
execute as @a[scores={bers_fr=1}] at @s run function kandy:sin/wrath/charm/crash
scoreboard players remove @a[scores={bers_fr=1..}] bers_fr 1
scoreboard players remove @a[scores={bers_ls=1..}] bers_ls 1

function kandy:sin/wrath/charm/visual
