# Shadow Warp fires on the moment you start sneaking, not while sneak is held
scoreboard players set #now ecl_tmp 0
execute if predicate kandy:sneaking run scoreboard players set #now ecl_tmp 1
execute if score #now ecl_tmp matches 1 unless score @s ecl_sneak matches 1 if score @s ecl_warp matches 0 at @s run function kandy:eclipse/warp
scoreboard players operation @s ecl_sneak = #now ecl_tmp
