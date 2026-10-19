$scoreboard players add @s tly_$(k) 1
$execute if score @s tly_$(k) matches 16.. run scoreboard players set @s tly_$(k) 15
scoreboard players operation @s tly_kind = #k tly_tmp
scoreboard players set @s tly_show 60
