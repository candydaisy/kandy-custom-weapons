# Run once per snowball, the tick after it's thrown
tag @s add smk.seen
execute unless items entity @s contents *[custom_data~{utility:"SmokeGrenade"}] unless data entity @s Item.components."minecraft:custom_data"{utility:"SmokeGrenade"} unless data entity @s item.components."minecraft:custom_data"{utility:"SmokeGrenade"} run return 0
tag @s add smk.proj
scoreboard players add #next smk_id 1
scoreboard players operation @s smk_id = #next smk_id

# Find the thrower by comparing UUIDs (execute on owner doesn't resolve projectile owners in 26.3)
data remove storage kandy:smoke owner
data modify storage kandy:smoke owner set from entity @s Owner
execute as @a run function kandy:smoke/match_thrower

execute at @s run summon minecraft:marker ~ ~ ~ {Tags:["smk.tracker","smk.new"]}
scoreboard players operation @e[type=marker,tag=smk.new] smk_id = #next smk_id
scoreboard players set @e[type=marker,tag=smk.new] smk_life 200
scoreboard players set @e[type=marker,tag=smk.new] smk_pid 0
execute if entity @a[tag=smk.thrower] run scoreboard players operation @e[type=marker,tag=smk.new] smk_pid = @a[tag=smk.thrower,limit=1] smk_pid
data modify entity @e[type=marker,tag=smk.new,limit=1] data.owner set from storage kandy:smoke owner
tag @e[type=marker,tag=smk.new] remove smk.new
tag @a remove smk.thrower
