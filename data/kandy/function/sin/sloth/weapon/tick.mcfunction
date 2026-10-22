# Pre-revamp shields get the Sloth item data the first time they're held (either hand)
execute as @a[tag=kandy.sloth.w] if items entity @s weapon.mainhand *[custom_data~{ability:"Abyssal"}] unless items entity @s weapon.mainhand *[custom_data~{sin:"sloth"}] run item modify entity @s weapon.mainhand {type:"minecraft:set_custom_data",tag:'{sin:"sloth",type:"weapon",tier:1,deeds:0}'}
execute as @a[tag=kandy.sloth.w] if items entity @s weapon.offhand *[custom_data~{ability:"Abyssal"}] unless items entity @s weapon.offhand *[custom_data~{sin:"sloth"}] run item modify entity @s weapon.offhand {type:"minecraft:set_custom_data",tag:'{sin:"sloth",type:"weapon",tier:1,deeds:0}'}
# The held shield's tier (bulw_t), and Heavy deepening to -15% at tier 3
execute as @a[tag=kandy.sloth.w] run function kandy:sin/sloth/weapon/tier
execute as @a[tag=kandy.sloth.w,scores={bulw_t=3},tag=!kandy.bulw_heavy] run function kandy:sin/sloth/weapon/heavy
execute as @a[tag=kandy.bulw_heavy] unless entity @s[tag=kandy.sloth.w,scores={bulw_t=3}] run function kandy:sin/sloth/weapon/unheavy

scoreboard players add @a[tag=kandy.sloth.w] bulw_chg 0
scoreboard players add @a[tag=kandy.sloth.w] bulw_pcd 0
scoreboard players add @a[tag=kandy.sloth.w] bulw_lock 0

# Pressure fades 10s after the last block
scoreboard players set @a[scores={bulw_decay=1}] bulw_chg 0
scoreboard players remove @a[scores={bulw_decay=1..}] bulw_decay 1

# Cooldowns
# Tidal Surge ready again (kandy.cd.sloth counts down in sin/tick, right after this)
execute as @a[tag=kandy.sloth.w,scores={kandy.cd.sloth=1}] at @s run playsound minecraft:block.conduit.ambient.short player @s ~ ~ ~ 1 1.4
scoreboard players remove @a[scores={bulw_pcd=1..}] bulw_pcd 1
scoreboard players remove @a[scores={bulw_lock=1..}] bulw_lock 1

# Parry window: tapping Sneak opens 16 ticks (0.8s); a whiffed tap locks new windows for 1s so spamming doesn't work
scoreboard players set @a[scores={bulw_brace=1}] bulw_lock 20
scoreboard players remove @a[scores={bulw_brace=1..}] bulw_brace 1
scoreboard players set @a bulw_tmp 0
execute as @a[tag=kandy.sloth.w] if predicate kandy:sneaking run scoreboard players set @s bulw_tmp 1
execute as @a[tag=kandy.sloth.w,scores={bulw_tmp=1,bulw_snk=0,bulw_lock=0,bulw_pcd=0}] run scoreboard players set @s bulw_brace 16
execute as @a[scores={bulw_brace=16}] at @s run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.5 1.8
execute as @a store result score @s bulw_snk run scoreboard players get @s bulw_tmp

# Tidal Surge: press Jump while sneaking with at least 1 charge
scoreboard players set @a bulw_tmp 0
execute as @a[tag=kandy.sloth.w] if predicate kandy:abyssal_bulwark_jump run scoreboard players set @s bulw_tmp 1
execute as @a[tag=kandy.sloth.w,scores={bulw_tmp=1,bulw_jmp=0,bulw_chg=1..}] if predicate kandy:sneaking at @s run function kandy:sin/active {sin:"sloth"}
execute as @a store result score @s bulw_jmp run scoreboard players get @s bulw_tmp

# Visuals: the bar shows while the shield is in your main hand, or in either hand once Pressure is stored
execute as @a[tag=kandy.sloth.w,scores={bulw_chg=3..}] at @s run particle minecraft:bubble_pop ~ ~1 ~ 0.4 0.6 0.4 0 1

# Tier 3 Parry roots the attacker for 0.5s
scoreboard players remove @e[scores={bulw_root=1..}] bulw_root 1
execute as @e[scores={bulw_root=0},tag=kandy.bulw_rooted] run function kandy:sin/sloth/weapon/unroot
