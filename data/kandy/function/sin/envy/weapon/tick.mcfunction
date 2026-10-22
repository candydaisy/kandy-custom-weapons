scoreboard players add @a[tag=kandy.envy.wi] fl_lt 0
# Falcon Volley ready again (kandy.cd.envy counts down in sin/tick, right after this)
execute as @a[scores={kandy.cd.envy=1},tag=kandy.envy.wi] at @s run playsound minecraft:entity.parrot.fly player @s ~ ~ ~ 1 1.4

# Lock On: keep your crosshair on a creature for 15 ticks (10 from tier 2) while drawing
execute as @a[scores={fl_use=1}] at @s anchored eyes positioned ^ ^ ^ run function kandy:sin/envy/weapon/aim
scoreboard players set @a[scores={fl_use=0}] fl_ct 0
scoreboard players set @a fl_use 0

# The lock glows while it lasts (and is tagged, for kill deeds), and holding it costs you:
# Tunnel Vision, Blindness and Slowness II (III at tier 3)
tag @e[tag=kandy.fl_locked] remove kandy.fl_locked
execute as @a[scores={fl_lt=1..}] run function kandy:sin/envy/weapon/lock_glow
effect give @a[scores={fl_lt=1..}] minecraft:blindness 1 0 true
execute as @a[scores={fl_lt=1..}] run function kandy:sin/tier
effect give @a[scores={fl_lt=1..,kandy.wt=..2}] minecraft:slowness 1 1 true
effect give @a[scores={fl_lt=1..,kandy.wt=3..}] minecraft:slowness 1 2 true
scoreboard players set @a[scores={fl_lt=1}] fl_lock 0
scoreboard players remove @a[scores={fl_lt=1..}] fl_lt 1

# New arrows, then steer the homing ones
execute as @e[type=#minecraft:arrows,tag=!kandy.fl_checked] run function kandy:sin/envy/weapon/check_arrow
execute as @e[type=#minecraft:arrows,tag=kandy.fl_homing,nbt={inGround:1b}] run tag @s remove kandy.fl_homing
execute as @e[type=#minecraft:arrows,tag=kandy.fl_homing] at @s run function kandy:sin/envy/weapon/steer
