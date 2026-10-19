scoreboard players operation @s kt_id = @s kandy_team
scoreboard players set @s kandy_team 0
tellraw @s [{"text":"Kandy: you joined team ","color":"light_purple"},{"score":{"name":"@s","objective":"kt_id"},"color":"gold"},{"text":". The Lifebloom Staff and Oathbound Warhorn now help everyone on it.","color":"light_purple"}]
