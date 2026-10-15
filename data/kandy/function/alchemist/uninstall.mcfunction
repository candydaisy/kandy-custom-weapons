execute as @a run attribute @s minecraft:max_health modifier remove kandy:alchemist
scoreboard objectives remove alch_cd
scoreboard objectives remove alch_drink
scoreboard objectives remove alch_potions
scoreboard objectives remove alch_tmp
scoreboard objectives remove alch_evt
scoreboard objectives remove alch_l_speed
scoreboard objectives remove alch_l_haste
scoreboard objectives remove alch_l_strength
scoreboard objectives remove alch_l_jump
scoreboard objectives remove alch_l_regen
scoreboard objectives remove alch_l_resist
scoreboard objectives remove alch_l_fireres
scoreboard objectives remove alch_l_water
scoreboard objectives remove alch_l_invisibility
scoreboard objectives remove alch_l_nightvis
scoreboard objectives remove alch_l_hpboost
scoreboard objectives remove alch_l_absorption
scoreboard objectives remove alch_l_slowfall
scoreboard objectives remove alch_l_luck
scoreboard objectives remove alch_l_dolphin
scoreboard objectives remove alch_l_conduit
data remove storage kandy:alchemist good
data remove storage kandy:alchemist fx
data remove storage kandy:alchemist cur
advancement revoke @a only kandy:alchemist/splashed
