# Rising edge of Sneak starts Event Horizon when it's ready
scoreboard players add @s grav_cd 0
scoreboard players add @s grav_vtx 0
scoreboard players set @s grav_snk 0
execute if predicate kandy:sneaking run scoreboard players set @s grav_snk 1
execute if score @s grav_snk matches 1 unless score @s grav_prev matches 1 if score @s grav_cd matches 0 if score @s grav_vtx matches 0 at @s run function kandy:worldbreaker/vortex_start
scoreboard players operation @s grav_prev = @s grav_snk
