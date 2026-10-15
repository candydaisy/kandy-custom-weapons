# New snowballs: pick out thrown bolas and give each a tracker
execute as @e[type=snowball,tag=!bola.seen] run function kandy:bola/check
execute as @e[type=marker,tag=bola.tracker] at @s run function kandy:bola/track

# Snare wears off
scoreboard players remove @e[scores={bola_root=1..}] bola_root 1
execute as @e[scores={bola_root=0}] run function kandy:bola/release
execute as @e[scores={bola_root=1..}] at @s run particle minecraft:block{block_state:{id:"minecraft:iron_chain"}} ~ ~0.3 ~ 0.3 0.1 0.3 0 2
scoreboard players remove @e[scores={bola_imm=1..}] bola_imm 1

# Pearl Lock: Ender Pearls thrown by a locked player fizzle and are refunded
scoreboard players remove @a[scores={bola_lock=1..}] bola_lock 1
execute if entity @a[scores={bola_lock=1..}] as @e[type=ender_pearl,tag=!bola.pseen] run function kandy:bola/pearl
