# Run as a revealed player each tick
execute if entity @s[tag=kandy.void_cloaked] run function kandy:void_talisman/uncloak
effect clear @s minecraft:invisibility
