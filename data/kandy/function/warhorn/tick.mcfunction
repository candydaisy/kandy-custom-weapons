scoreboard players add @a[tag=kandy.inv.warhorn] wh_cd 0
execute as @a[scores={wh_cd=1},tag=kandy.inv.warhorn] at @s run playsound minecraft:item.goat_horn.sound.0 player @s ~ ~ ~ 0.3 1.6
scoreboard players remove @a[scores={wh_cd=1..}] wh_cd 1
execute as @a[scores={wh_used=1..}] at @s run function kandy:warhorn/blow
scoreboard players set @a[scores={wh_used=1..}] wh_used 0
