# Advancement reward: a full-draw Eclipse arrow hit something. Mark everything it pierced
advancement revoke @s only kandy:hit/eclipse
tag @s add kandy.attacker
execute as @e[distance=..64,tag=!kandy.attacker,nbt={HurtTime:10s}] if function kandy:util/hurt_by_attacker run tag @s add ecl.marked
tag @s remove kandy.attacker
effect give @e[tag=ecl.marked] minecraft:glowing 3 0
effect give @e[tag=ecl.marked] minecraft:darkness 1 0
execute as @e[tag=ecl.marked] at @s run particle minecraft:witch ~ ~1 ~ 0.3 0.5 0.3 0.02 10
# Lets a Singularity tracker find what its arrow hit
tag @e[tag=ecl.marked] add ecl.recent
tag @e[tag=ecl.marked] remove ecl.marked
