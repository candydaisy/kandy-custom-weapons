# Run as and at a carrier every tick
scoreboard players add @s way_cd 0
scoreboard players add @s way_wait 0
execute unless predicate kandy:sneaking run scoreboard players set @s way_lock 0
execute unless predicate kandy:sneaking run return run scoreboard players set @s way_chg 0

# Moving (in tenths of a block) cancels the charge
data modify storage kandy:wayfarers_compass p set from entity @s Pos
execute store result score #x way_tmp run data get storage kandy:wayfarers_compass p[0] 10
execute store result score #y way_tmp run data get storage kandy:wayfarers_compass p[1] 10
execute store result score #z way_tmp run data get storage kandy:wayfarers_compass p[2] 10
scoreboard players set #moved way_tmp 0
execute unless score #x way_tmp = @s way_px run scoreboard players set #moved way_tmp 1
execute unless score #y way_tmp = @s way_py run scoreboard players set #moved way_tmp 1
execute unless score #z way_tmp = @s way_pz run scoreboard players set #moved way_tmp 1
scoreboard players operation @s way_px = #x way_tmp
scoreboard players operation @s way_py = #y way_tmp
scoreboard players operation @s way_pz = #z way_tmp
execute if score #moved way_tmp matches 1 run return run scoreboard players set @s way_chg 0

# One attempt per sneak press, and nothing while recharging or already recalling
execute if score @s way_lock matches 1 run return 0
execute if score @s way_cd matches 1.. run return 0
execute if score @s way_wait matches 1.. run return 0

scoreboard players add @s way_chg 1
particle minecraft:portal ~ ~0.8 ~ 0.4 0.6 0.4 0.3 3
execute if score @s way_chg matches 1 run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.6 0.8
execute if score @s way_chg matches 20 run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.6 1.1
execute if score @s way_chg matches 40 run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.6 1.4
execute if score @s way_chg matches 60.. run function kandy:wayfarers_compass/recall
