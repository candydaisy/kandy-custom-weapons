# Run as a player holding a Repulsor Mine: mines placed and cooldown on the actionbar
scoreboard players operation #pid rep_tmp = @s rep_pid
scoreboard players set @s rep_n 0
tag @s add kandy.rep_counter
execute if score @s rep_pid matches 1.. as @e[type=marker,tag=kandy.rep_mine] if score @s rep_pid = #pid rep_tmp run scoreboard players add @a[tag=kandy.rep_counter,limit=1] rep_n 1
tag @s remove kandy.rep_counter
scoreboard players operation @s rep_s = @s rep_cd
scoreboard players add @s rep_s 19
scoreboard players operation @s rep_s /= #20 rep_tmp
execute if score @s rep_cd matches 0 run title @s actionbar [{"text":"✦ Repulsor Mines ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"rep_n"},"color":"white"},{"text":"/2 placed ","color":"gray"},{"text":"— ready","color":"white"}]
execute if score @s rep_cd matches 1.. run title @s actionbar [{"text":"✦ Repulsor Mines ","color":"aqua","bold":true},{"score":{"name":"@s","objective":"rep_n"},"color":"white"},{"text":"/2 placed ","color":"gray"},{"text":"— ","color":"gray"},{"score":{"name":"@s","objective":"rep_s"},"color":"gray"},{"text":"s","color":"gray"}]
