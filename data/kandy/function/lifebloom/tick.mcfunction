scoreboard players add @a[tag=kandy.inv.lifebloom] lb_cd 0
scoreboard players add @a[tag=kandy.inv.lifebloom] lb_scd 0
execute as @a[scores={lb_cd=1},tag=kandy.inv.lifebloom] at @s run playsound minecraft:block.azalea_leaves.place player @s ~ ~ ~ 1 1.4
scoreboard players remove @a[scores={lb_cd=1..}] lb_cd 1
scoreboard players remove @a[scores={lb_scd=1..}] lb_scd 1

# Right-click: the press itself is a Mending Pulse; keep holding 2s for a Sanctuary
scoreboard players add @a[scores={lb_use=1}] lb_hold 1
execute as @a[scores={lb_use=1,lb_hold=1}] at @s run function kandy:lifebloom/pulse
execute as @a[scores={lb_use=1,lb_hold=40}] at @s run function kandy:lifebloom/sanctuary
execute as @a[scores={lb_use=1,lb_hold=1..39}] at @s run particle minecraft:cherry_leaves ~ ~1 ~ 0.4 0.5 0.4 0 1
scoreboard players set @a[scores={lb_use=0}] lb_hold 0
scoreboard players set @a lb_use 0

# Sanctuary is an aura that follows its caster
execute as @a[scores={lb_sa=1..}] at @s run function kandy:lifebloom/sanct_tick
