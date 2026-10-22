# Active: Devour. Every echo you left on creatures within 6 blocks goes off at once, and each one feeds you (+1 hunger)
execute unless score @s soul_pid matches 1.. run return run function kandy:sin/gluttony/weapon/fizzle
scoreboard players operation #me soul_pid = @s soul_pid
scoreboard players set #eaten soul_tmp 0
tag @s add kandy.soul_glutton
execute as @e[distance=..6,scores={echo_stacks=1..}] if score @s echo_owner = #me soul_pid at @s run function kandy:sin/gluttony/weapon/devour
tag @s remove kandy.soul_glutton
# Nothing to eat: no cooldown
execute if score #eaten soul_tmp matches 0 run return run function kandy:sin/gluttony/weapon/fizzle

scoreboard players set @s kandy.cd.gluttony 300
scoreboard players set @s kandy.cdmax.gluttony 300
# Saturation is instant, so its duration is ticks of +1 hunger each
execute store result storage kandy:soul feed.n int 1 run scoreboard players get #eaten soul_tmp
function kandy:sin/gluttony/weapon/feed with storage kandy:soul feed
# Feast: also Saturation I for 2s
execute if entity @s[tag=kandy.gluttony.set] run effect give @s minecraft:saturation 2 0 true
# Tier 3: about 1 HP per echo (Regeneration III heals 1 HP every 12 ticks)
function kandy:sin/tier
scoreboard players operation #s soul_tmp = #eaten soul_tmp
scoreboard players operation #s soul_tmp *= #3 soul_tmp
scoreboard players add #s soul_tmp 4
scoreboard players operation #s soul_tmp /= #5 soul_tmp
execute store result storage kandy:soul feed.s int 1 run scoreboard players get #s soul_tmp
execute if score @s kandy.wt matches 3 run function kandy:sin/gluttony/weapon/heal with storage kandy:soul feed
playsound minecraft:entity.generic.eat player @a[distance=..16] ~ ~ ~ 1 0.7
playsound minecraft:particle.soul_escape player @a[distance=..16] ~ ~ ~ 1 0.6
particle minecraft:soul ~ ~1 ~ 0.4 0.5 0.4 0.03 12

# Devours deepen a tier 1 dagger (tier 2 after 15)
execute if score @s kandy.wt matches 1 run function kandy:sin/deed {sin:"gluttony",need:15,what:"Devours",name:"Gluttony",color:"#ff8c1a"}
