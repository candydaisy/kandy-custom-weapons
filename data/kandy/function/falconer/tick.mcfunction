scoreboard players add @a[tag=kandy.inv.falconer] fl_cd 0
scoreboard players add @a[tag=kandy.inv.falconer] fl_lt 0
execute as @a[scores={fl_cd=1},tag=kandy.inv.falconer] at @s run playsound minecraft:entity.parrot.fly player @s ~ ~ ~ 1 1.4
scoreboard players remove @a[scores={fl_cd=1..}] fl_cd 1

# Lock On: keep your crosshair on a creature for 15 ticks while drawing
execute as @a[scores={fl_use=1}] at @s anchored eyes positioned ^ ^ ^ run function kandy:falconer/aim
scoreboard players set @a[scores={fl_use=0}] fl_ct 0
scoreboard players set @a fl_use 0

# The lock glows while it lasts
execute as @a[scores={fl_lt=1..}] run function kandy:falconer/lock_glow
scoreboard players set @a[scores={fl_lt=1}] fl_lock 0
scoreboard players remove @a[scores={fl_lt=1..}] fl_lt 1

# New arrows, then steer the homing ones
execute as @e[type=#minecraft:arrows,tag=!kandy.fl_checked] run function kandy:falconer/check_arrow
execute as @e[type=#minecraft:arrows,tag=kandy.fl_homing,nbt={inGround:1b}] run tag @s remove kandy.fl_homing
execute as @e[type=#minecraft:arrows,tag=kandy.fl_homing] at @s run function kandy:falconer/steer
