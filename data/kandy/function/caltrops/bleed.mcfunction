# Sprinting while crippled tears the wound open: 1 damage per second of sprinting
scoreboard players set @s calt_bleed 0
damage @s 1 kandy:caltrops_puncture
particle minecraft:block{block_state:{id:"minecraft:redstone_block"}} ~ ~0.6 ~ 0.2 0.3 0.2 0 8
playsound minecraft:entity.player.hurt_sweet_berry_bush player @a[distance=..12] ~ ~ ~ 0.6 1.2
