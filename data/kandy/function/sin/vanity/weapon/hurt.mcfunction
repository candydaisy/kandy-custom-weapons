# Advancement reward: the player took damage. It breaks the Vanity unlock streak,
# and with the stiletto in hand, being hurt from full health is Blemished: no Flawless for 10s (15s at tier 3) and Weakness I 3s
advancement revoke @s only kandy:sin/vanity/hurt
scoreboard players set @s kandy.vain 0
execute unless entity @s[tag=kandy.vanity.w,tag=kandy.vain_full] run return 0
execute if score @s vain_bl matches 1.. run return 0
function kandy:sin/tier
scoreboard players set @s vain_bl 200
execute if score @s kandy.wt matches 3 run scoreboard players set @s vain_bl 300
effect give @s minecraft:weakness 3 0
playsound minecraft:block.glass.break player @a[distance=..16] ~ ~ ~ 1 1.2
particle minecraft:dust{color:[1.0,0.85,0.95],scale:1.2} ~ ~1 ~ 0.4 0.6 0.4 0 20
