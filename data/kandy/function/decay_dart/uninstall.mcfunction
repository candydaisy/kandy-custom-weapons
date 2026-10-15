scoreboard objectives remove dart_nec
scoreboard objectives remove dart_hp
scoreboard objectives remove dart_last
scoreboard objectives remove dart_totem
scoreboard objectives remove dart_tmp
tag @e[type=#minecraft:arrows] remove dart.arrow
tag @e[type=#minecraft:arrows] remove dart.checked
data remove storage kandy:decay_dart owner
data remove storage kandy:decay_dart cmp
data remove storage kandy:decay_dart amt
advancement revoke @a only kandy:decay_dart/hit
advancement revoke @a only kandy:decay_dart/blocked
