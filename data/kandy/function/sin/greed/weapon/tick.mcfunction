scoreboard players add @a[tag=kandy.greed.wi] cw_gcd 0
scoreboard players add @a[tag=kandy.greed.wi] cw_tt 0
scoreboard players add @a[tag=kandy.greed.wi] cw_reel 0
scoreboard players add @a[tag=kandy.greed.wi] cw_grp 0
# Tether ready again (the shared kandy.cd counts down in sin/tick, right after this)
execute as @a[scores={kandy.cd=1},tag=kandy.greed.wi] at @s run playsound minecraft:block.chain.place player @s ~ ~ ~ 0.6 1.4
scoreboard players remove @a[scores={cw_gcd=1..}] cw_gcd 1

# New bolts: pick out the ones fired from the Arbalest and remember who shot them
execute as @e[type=#minecraft:arrows,tag=!kandy.cw_seen] run function kandy:sin/greed/weapon/check_arrow
execute as @e[type=#minecraft:arrows,tag=kandy.cw_bolt,nbt={inGround:0b}] at @s run particle minecraft:crit ~ ~ ~ 0 0 0 0 1

execute as @a[scores={cw_tt=1..}] at @s run function kandy:sin/greed/weapon/tether_tick
execute as @a[scores={cw_grp=1..}] at @s run function kandy:sin/greed/weapon/grapple_tick

# Sneak: Reel while Tethered, otherwise Grapple to a fresh bolt
execute as @a[tag=kandy.greed.wi] run function kandy:sin/greed/weapon/input
scoreboard players set @a[tag=!kandy.greed.wi] cw_prev 1

# No fall damage after being pulled until you land
scoreboard players remove @a[scores={cw_fall=1..}] cw_fall 1
execute as @a[tag=kandy.cw_nofall,scores={cw_fall=..0}] if predicate kandy:tempest_grounded run function kandy:sin/greed/weapon/landed
