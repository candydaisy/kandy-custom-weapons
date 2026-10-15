# Advancement reward (as the victim): a Decay Dart hit a raised shield. It phases through for 3 true damage and Necrosis
advancement revoke @s only kandy:decay_dart/blocked

# Credit the shooter: match the deflected dart's Owner UUID against players
tag @a remove dart.src
data remove storage kandy:decay_dart owner
execute as @e[type=#minecraft:arrows,tag=dart.arrow,distance=..5,sort=nearest,limit=1] run data modify storage kandy:decay_dart owner set from entity @s Owner
execute if data storage kandy:decay_dart owner as @a run function kandy:decay_dart/match_owner
execute if entity @a[tag=dart.src] run damage @s 3 kandy:decay_dart_pierce by @a[tag=dart.src,limit=1]
execute unless entity @a[tag=dart.src] run damage @s 3 kandy:decay_dart_pierce
tag @a remove dart.src

# The dart is spent instead of bouncing off
kill @e[type=#minecraft:arrows,tag=dart.arrow,distance=..5,sort=nearest,limit=1]
particle minecraft:item_slime ~ ~1.2 ~ 0.3 0.3 0.3 0.05 12
playsound minecraft:item.shield.break player @a[distance=..16] ~ ~ ~ 0.5 1.6
function kandy:decay_dart/afflict
