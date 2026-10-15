scoreboard players set @s rep_pick 0
execute as @e[type=marker,tag=kandy.rep_near,sort=nearest,limit=1] run function kandy:repulsor/remove
execute unless entity @s[gamemode=creative] run function kandy:repulsor/refund
playsound minecraft:entity.item.pickup player @s ~ ~ ~ 0.8 1.2
