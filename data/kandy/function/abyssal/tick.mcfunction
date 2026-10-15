# Who has the Bulwark raised-ready (mainhand or offhand)
tag @a remove kandy.bulw_hold
tag @a[tag=kandy.main.abyssal] add kandy.bulw_hold
tag @a[tag=kandy.off.abyssal] add kandy.bulw_hold

scoreboard players add @a[tag=kandy.bulw_hold] bulw_chg 0
scoreboard players add @a[tag=kandy.bulw_hold] bulw_scd 0
scoreboard players add @a[tag=kandy.bulw_hold] bulw_pcd 0
scoreboard players add @a[tag=kandy.bulw_hold] bulw_lock 0

# Pressure fades 10s after the last block
scoreboard players set @a[scores={bulw_decay=1}] bulw_chg 0
scoreboard players remove @a[scores={bulw_decay=1..}] bulw_decay 1

# Cooldowns
execute as @a[tag=kandy.bulw_hold,scores={bulw_scd=1}] at @s run playsound minecraft:block.conduit.ambient.short player @s ~ ~ ~ 1 1.4
scoreboard players remove @a[scores={bulw_scd=1..}] bulw_scd 1
scoreboard players remove @a[scores={bulw_pcd=1..}] bulw_pcd 1
scoreboard players remove @a[scores={bulw_lock=1..}] bulw_lock 1

# Parry window: tapping Sneak opens 16 ticks (0.8s); a whiffed tap locks new windows for 1s so spamming doesn't work
scoreboard players set @a[scores={bulw_brace=1}] bulw_lock 20
scoreboard players remove @a[scores={bulw_brace=1..}] bulw_brace 1
scoreboard players set @a bulw_tmp 0
execute as @a[tag=kandy.bulw_hold] if predicate kandy:sneaking run scoreboard players set @s bulw_tmp 1
execute as @a[tag=kandy.bulw_hold,scores={bulw_tmp=1,bulw_snk=0,bulw_lock=0,bulw_pcd=0}] run scoreboard players set @s bulw_brace 16
execute as @a[scores={bulw_brace=16}] at @s run playsound minecraft:block.amethyst_block.chime player @s ~ ~ ~ 0.5 1.8
execute as @a store result score @s bulw_snk run scoreboard players get @s bulw_tmp

# Tidal Surge: press Jump while sneaking with at least 1 charge
scoreboard players set @a bulw_tmp 0
execute as @a[tag=kandy.bulw_hold] if predicate kandy:abyssal_bulwark_jump run scoreboard players set @s bulw_tmp 1
execute as @a[tag=kandy.bulw_hold,scores={bulw_tmp=1,bulw_jmp=0,bulw_chg=1..,bulw_scd=0}] if predicate kandy:sneaking at @s run function kandy:abyssal/surge
execute as @a store result score @s bulw_jmp run scoreboard players get @s bulw_tmp

# Visuals: the bar shows while the shield is in your main hand, or in either hand once Pressure is stored
title @a[tag=kandy.main.abyssal,scores={bulw_chg=0,bulw_scd=0}] actionbar [{"text":"✦ Abyssal Pressure ✦ ","color":"aqua","bold":true},{"text":"","color":"#4facfe"},{"text":"■■■■■","color":"dark_gray"},{"text":"  Block to build Pressure","color":"dark_aqua","italic":true}]
title @a[tag=kandy.main.abyssal,scores={bulw_chg=0,bulw_scd=1..}] actionbar [{"text":"✦ Abyssal Pressure ✦ ","color":"aqua","bold":true},{"text":"","color":"#4facfe"},{"text":"■■■■■","color":"dark_gray"},{"text":"  Surge recharging","color":"gray","italic":true}]
title @a[tag=kandy.bulw_hold,scores={bulw_chg=1,bulw_scd=0}] actionbar [{"text":"✦ Abyssal Pressure ✦ ","color":"aqua","bold":true},{"text":"■","color":"#4facfe"},{"text":"■■■■","color":"dark_gray"},{"text":"  Surge ready","color":"dark_aqua","italic":true}]
title @a[tag=kandy.bulw_hold,scores={bulw_chg=1,bulw_scd=1..}] actionbar [{"text":"✦ Abyssal Pressure ✦ ","color":"aqua","bold":true},{"text":"■","color":"#4facfe"},{"text":"■■■■","color":"dark_gray"},{"text":"  Surge recharging","color":"gray","italic":true}]
title @a[tag=kandy.bulw_hold,scores={bulw_chg=2,bulw_scd=0}] actionbar [{"text":"✦ Abyssal Pressure ✦ ","color":"aqua","bold":true},{"text":"■■","color":"#4facfe"},{"text":"■■■","color":"dark_gray"},{"text":"  Surge ready","color":"dark_aqua","italic":true}]
title @a[tag=kandy.bulw_hold,scores={bulw_chg=2,bulw_scd=1..}] actionbar [{"text":"✦ Abyssal Pressure ✦ ","color":"aqua","bold":true},{"text":"■■","color":"#4facfe"},{"text":"■■■","color":"dark_gray"},{"text":"  Surge recharging","color":"gray","italic":true}]
title @a[tag=kandy.bulw_hold,scores={bulw_chg=3,bulw_scd=0}] actionbar [{"text":"✦ Abyssal Pressure ✦ ","color":"aqua","bold":true},{"text":"■■■","color":"#4facfe"},{"text":"■■","color":"dark_gray"},{"text":"  Surge ready","color":"dark_aqua","italic":true}]
title @a[tag=kandy.bulw_hold,scores={bulw_chg=3,bulw_scd=1..}] actionbar [{"text":"✦ Abyssal Pressure ✦ ","color":"aqua","bold":true},{"text":"■■■","color":"#4facfe"},{"text":"■■","color":"dark_gray"},{"text":"  Surge recharging","color":"gray","italic":true}]
title @a[tag=kandy.bulw_hold,scores={bulw_chg=4,bulw_scd=0}] actionbar [{"text":"✦ Abyssal Pressure ✦ ","color":"aqua","bold":true},{"text":"■■■■","color":"#4facfe"},{"text":"■","color":"dark_gray"},{"text":"  Surge ready","color":"dark_aqua","italic":true}]
title @a[tag=kandy.bulw_hold,scores={bulw_chg=4,bulw_scd=1..}] actionbar [{"text":"✦ Abyssal Pressure ✦ ","color":"aqua","bold":true},{"text":"■■■■","color":"#4facfe"},{"text":"■","color":"dark_gray"},{"text":"  Surge recharging","color":"gray","italic":true}]
title @a[tag=kandy.bulw_hold,scores={bulw_chg=5,bulw_scd=0}] actionbar [{"text":"✦ Abyssal Pressure ✦ ","color":"aqua","bold":true},{"text":"■■■■■","color":"#4facfe"},{"text":"","color":"dark_gray"},{"text":"  Surge ready","color":"dark_aqua","italic":true}]
title @a[tag=kandy.bulw_hold,scores={bulw_chg=5,bulw_scd=1..}] actionbar [{"text":"✦ Abyssal Pressure ✦ ","color":"aqua","bold":true},{"text":"■■■■■","color":"#4facfe"},{"text":"","color":"dark_gray"},{"text":"  Surge recharging","color":"gray","italic":true}]
execute as @a[tag=kandy.bulw_hold,scores={bulw_chg=3..}] at @s run particle minecraft:bubble_pop ~ ~1 ~ 0.4 0.6 0.4 0 1
