# Run as a tracker: follow its grenade one tick behind, burst where it was last seen once it's gone
tag @e[type=snowball,tag=smk.match] remove smk.match
scoreboard players operation #id smk_tmp = @s smk_id
execute as @e[type=snowball,tag=smk.proj] if score @s smk_id = #id smk_tmp run tag @s add smk.match
scoreboard players remove @s smk_life 1
execute unless entity @e[type=snowball,tag=smk.match] at @s run return run function kandy:smoke/burst
execute if score @s smk_life matches ..0 run kill @e[type=snowball,tag=smk.match]
execute if score @s smk_life matches ..0 at @s run return run function kandy:smoke/burst
tp @s @e[type=snowball,tag=smk.match,limit=1]
tag @e[type=snowball,tag=smk.match] remove smk.match
