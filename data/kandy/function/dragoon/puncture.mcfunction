# Run as a jabbed creature: stacks from another attacker, or after 2s, start over
execute unless score @s dg_by = #id dg_tmp run scoreboard players set @s dg_ps 0
execute unless score @s dg_pt matches 1.. run scoreboard players set @s dg_ps 0
scoreboard players operation @s dg_by = #id dg_tmp
execute if score @s dg_ps matches 1 run damage @s 1 kandy:dragoon_pierce by @p[tag=kandy.dg_busy]
execute if score @s dg_ps matches 2 run damage @s 2 kandy:dragoon_pierce by @p[tag=kandy.dg_busy]
execute if score @s dg_ps matches 3 run damage @s 3 kandy:dragoon_pierce by @p[tag=kandy.dg_busy]
scoreboard players add @s[scores={dg_ps=..2}] dg_ps 1
scoreboard players set @s dg_pt 40
particle minecraft:damage_indicator ~ ~1 ~ 0.2 0.3 0.2 0.1 2
