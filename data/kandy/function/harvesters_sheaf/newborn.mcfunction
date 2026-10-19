# Babies start at Age -24000 and count up
execute store result score #age hvs_tmp run data get entity @s Age
execute if score #age hvs_tmp matches ..-23980 run return 1
return fail
