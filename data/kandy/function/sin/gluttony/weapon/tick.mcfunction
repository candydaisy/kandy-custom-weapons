# Pre-revamp daggers get the new item data (and with it, right-click) the first time they're held
execute as @a[tag=kandy.gluttony.w] if items entity @s weapon.mainhand *[custom_data~{ability:"Echo"}] unless items entity @s weapon.mainhand *[custom_data~{sin:"gluttony"}] run function kandy:sin/gluttony/weapon/migrate
# Devour ready again (kandy.cd.gluttony counts down in sin/tick, right after this)
execute as @a[scores={kandy.cd.gluttony=1},tag=kandy.gluttony.wi] at @s run playsound minecraft:entity.generic.eat player @s ~ ~ ~ 0.6 1.4

# Echoes tick down; a creature that dies with echoes passes them on (Soul Spread)
execute as @e[scores={echo_timer=1..}] run scoreboard players remove @s echo_timer 1
execute as @e[scores={echo_stacks=1..},nbt={DeathTime:1s}] at @s run function kandy:sin/gluttony/weapon/spread
execute as @e[scores={echo_timer=0,echo_stacks=1..}] run function kandy:sin/gluttony/weapon/strike
execute as @e[scores={echo_timer=0,echo_stacks=1..}] run scoreboard players remove @s echo_stacks 1
execute as @e[scores={echo_timer=0,echo_stacks=1..}] run scoreboard players set @s echo_timer 20
execute as @e[scores={echo_timer=0,echo_stacks=0}] run scoreboard players set @s echo_timer -1
execute as @e[scores={echo_stacks=1..}] at @s run particle minecraft:witch ~ ~1 ~ 0.3 0.5 0.3 0.01 10

# Right-click: Devour. soul_use is set by the using_item advancement; only the first tick of a press counts
execute as @a[tag=kandy.gluttony.w,scores={soul_use=1}] unless score @s soul_held matches 1 at @s run function kandy:sin/gluttony/weapon/press
scoreboard players add @a soul_use 0
execute as @a run scoreboard players operation @s soul_held = @s soul_use
scoreboard players set @a[scores={soul_use=1..}] soul_use 0
