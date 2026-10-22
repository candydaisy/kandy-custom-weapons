# Advancement reward: the player killed something. Feast (set bonus): +1 max heart for 45s per kill, up to 4
advancement revoke @s only kandy:sin/gluttony/feast
execute unless entity @s[tag=kandy.gluttony.set] run return 0
scoreboard players add @s glut_s 1
scoreboard players set @s[scores={glut_s=5..}] glut_s 4
scoreboard players set @s glut_t 900
attribute @s minecraft:max_health modifier remove kandy:gluttony_feast
execute if score @s glut_s matches 1 run attribute @s minecraft:max_health modifier add kandy:gluttony_feast 2 add_value
execute if score @s glut_s matches 2 run attribute @s minecraft:max_health modifier add kandy:gluttony_feast 4 add_value
execute if score @s glut_s matches 3 run attribute @s minecraft:max_health modifier add kandy:gluttony_feast 6 add_value
execute if score @s glut_s matches 4 run attribute @s minecraft:max_health modifier add kandy:gluttony_feast 8 add_value
effect give @s minecraft:regeneration 3 1 true
playsound minecraft:entity.player.burp player @s ~ ~ ~ 0.8 1
particle minecraft:soul ~ ~1 ~ 0.4 0.6 0.4 0.03 8
