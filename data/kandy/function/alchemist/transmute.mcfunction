# Run as a carrier off cooldown: cleanse supported debuffs and turn them into short buffs.
# Debuffs the pack's own weapons apply as drawbacks are left alone.
scoreboard players set #any alch_tmp 0

scoreboard players set #fx alch_tmp 0
execute store success score #fx alch_tmp run effect clear @s minecraft:poison
execute if score #fx alch_tmp matches 1 run effect give @s minecraft:regeneration 4 0
execute if score #fx alch_tmp matches 1 run scoreboard players set #any alch_tmp 1

scoreboard players set #fx alch_tmp 0
execute store success score #fx alch_tmp run effect clear @s minecraft:wither
execute if score #fx alch_tmp matches 1 run effect give @s minecraft:regeneration 4 0
execute if score #fx alch_tmp matches 1 run scoreboard players set #any alch_tmp 1

scoreboard players set #fx alch_tmp 0
execute if entity @s[tag=!kandy.inv.bloodpact,tag=!kandy.main.worldbreaker] store success score #fx alch_tmp run effect clear @s minecraft:slowness
execute if entity @s[tag=!kandy.inv.bloodpact,tag=!kandy.main.worldbreaker] if score #fx alch_tmp matches 1 run effect give @s minecraft:speed 4 0
execute if entity @s[tag=!kandy.inv.bloodpact,tag=!kandy.main.worldbreaker] if score #fx alch_tmp matches 1 run scoreboard players set #any alch_tmp 1

# Weakness is only cleansed, never turned into Strength
scoreboard players set #fx alch_tmp 0
execute if entity @s[tag=!kandy.inv.bloodpact] store success score #fx alch_tmp run effect clear @s minecraft:weakness
execute if entity @s[tag=!kandy.inv.bloodpact] if score #fx alch_tmp matches 1 run scoreboard players set #any alch_tmp 1

scoreboard players set #fx alch_tmp 0
execute store success score #fx alch_tmp run effect clear @s minecraft:mining_fatigue
execute if score #fx alch_tmp matches 1 run effect give @s minecraft:haste 8 0
execute if score #fx alch_tmp matches 1 run scoreboard players set #any alch_tmp 1

scoreboard players set #fx alch_tmp 0
execute if entity @s[tag=!kandy.inv.bloodpact] store success score #fx alch_tmp run effect clear @s minecraft:darkness
execute if entity @s[tag=!kandy.inv.bloodpact] if score #fx alch_tmp matches 1 run effect give @s minecraft:night_vision 10 0
execute if entity @s[tag=!kandy.inv.bloodpact] if score #fx alch_tmp matches 1 run scoreboard players set #any alch_tmp 1

scoreboard players set #fx alch_tmp 0
execute store success score #fx alch_tmp run effect clear @s minecraft:blindness
execute if score #fx alch_tmp matches 1 run effect give @s minecraft:night_vision 10 0
execute if score #fx alch_tmp matches 1 run scoreboard players set #any alch_tmp 1

execute if score #any alch_tmp matches 0 run return 0
scoreboard players set @s alch_cd 300
particle minecraft:happy_villager ~ ~1 ~ 0.5 0.5 0.5 0 10
particle minecraft:witch ~ ~1 ~ 0.4 0.5 0.4 0.02 8
playsound minecraft:block.amethyst_block.chime player @a[distance=..16] ~ ~ ~ 1.5 1.5
