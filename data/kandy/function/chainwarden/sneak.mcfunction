# Tethered: start reeling (0.75s)
execute if score @s cw_tt matches 1.. if score @s cw_reel matches 0 run return run scoreboard players set @s cw_reel 15
execute if score @s cw_tt matches 1.. run return 0
# Grapple: your own bolt that stuck in a block within the last 3s
execute if score @s cw_gcd matches 1.. run return 0
execute if score @s cw_grp matches 1.. run return 0
scoreboard players operation #id cw_tmp = @s ecl_pid
execute as @e[type=#minecraft:arrows,tag=kandy.cw_bolt,distance=..30,nbt={inGround:1b}] if score @s cw_by = #id cw_tmp store result score @s cw_tmp run data get entity @s life
execute as @e[type=#minecraft:arrows,tag=kandy.cw_bolt,distance=..30,nbt={inGround:1b},scores={cw_tmp=..60}] if score @s cw_by = #id cw_tmp run tag @s add kandy.cw_cand
execute unless entity @e[tag=kandy.cw_cand] run return 0
tag @e[tag=kandy.cw_cand,sort=nearest,limit=1] add kandy.cw_anchor
tag @e[tag=kandy.cw_cand] remove kandy.cw_cand
scoreboard players set @s cw_grp 15
scoreboard players set @s cw_gcd 160
function kandy:chainwarden/nofall
playsound minecraft:item.crossbow.loading_end player @a[distance=..16] ~ ~ ~ 1 0.6
