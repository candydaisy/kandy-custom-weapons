execute as @e[tag=kandy.chr_frozen] run data merge entity @s {NoAI:0b}
tag @e[tag=kandy.chr_frozen] remove kandy.chr_frozen
kill @e[type=minecraft:marker,tag=kandy.chr_anchor]
advancement revoke @a only kandy:hit/chronos
advancement revoke @a only kandy:chronos/using
scoreboard objectives remove chr_use
scoreboard objectives remove chr_held
scoreboard objectives remove chr_id
scoreboard objectives remove chr_hp
scoreboard objectives remove chr_ahp
scoreboard objectives remove chr_anc
scoreboard objectives remove chr_cd
scoreboard objectives remove chr_death
scoreboard objectives remove chr_pt
scoreboard objectives remove chr_ps
scoreboard objectives remove chr_st
scoreboard objectives remove chr_scd
scoreboard objectives remove chr_tmp
