scoreboard players add @a[tag=kandy.main.dragoon] dg_cd 0
scoreboard players add @a[tag=kandy.main.dragoon] dg_st 0
scoreboard players remove @a[scores={dg_use=1..}] dg_use 1
execute as @a[scores={dg_cd=1},tag=kandy.inv.dragoon] at @s run playsound minecraft:entity.ender_dragon.flap player @s ~ ~ ~ 0.5 1.4
scoreboard players remove @a[scores={dg_cd=1..}] dg_cd 1

# Puncture window and Skewer wear off
scoreboard players remove @e[scores={dg_pt=1..}] dg_pt 1
execute as @e[scores={dg_sk=1}] run attribute @s minecraft:armor modifier remove kandy:skewer
scoreboard players remove @e[scores={dg_sk=1..}] dg_sk 1

# Sneak + Jump: Leap; Sneak again midair: Dive
execute as @a[tag=kandy.main.dragoon] run function kandy:dragoon/input
execute as @a[scores={dg_lev=1}] run effect clear @s minecraft:levitation
scoreboard players remove @a[scores={dg_lev=1..}] dg_lev 1
execute as @a[scores={dg_dive=1}] at @s run function kandy:dragoon/dive
# A Leap that never Dived: the cooldown starts when you land (or after 3.5s)
execute as @a[scores={dg_st=1..,dg_dive=0,dg_lev=0}] if predicate kandy:tempest_grounded run function kandy:dragoon/leap_end
execute as @a[scores={dg_st=1}] run function kandy:dragoon/leap_end
scoreboard players remove @a[scores={dg_st=1..}] dg_st 1

scoreboard players remove @a[scores={dg_fall=1..}] dg_fall 1
execute as @a[tag=kandy.dg_nofall,scores={dg_fall=..0}] if predicate kandy:tempest_grounded run function kandy:dragoon/landed
