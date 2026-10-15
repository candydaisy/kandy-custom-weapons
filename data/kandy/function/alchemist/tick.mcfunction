scoreboard players remove @a[scores={alch_cd=1..}] alch_cd 1

# Toxin Transmutation
execute as @a[tag=kandy.charm.alchemist] unless score @s alch_cd matches 1.. at @s run function kandy:alchemist/transmute

# Elixir Infusion: drinking, or a splash/lingering potion landing on you, marks this tick for a check
scoreboard players set @a[scores={alch_drink=1..}] alch_evt 1
scoreboard players set @a[scores={alch_drink=1..}] alch_drink 0
execute as @a[tag=kandy.charm.alchemist] at @s run function kandy:alchemist/watch
scoreboard players set @a[scores={alch_evt=1..}] alch_evt 0

# +1 max heart while carrying 3+ brewed potions (water bottles don't count)
scoreboard players set @a alch_potions 0
execute as @a[tag=kandy.charm.alchemist] store result score @s alch_tmp run clear @s minecraft:potion[!potion_contents={potion:"minecraft:water"}] 0
execute as @a[tag=kandy.charm.alchemist] run scoreboard players operation @s alch_potions += @s alch_tmp
execute as @a[tag=kandy.charm.alchemist] store result score @s alch_tmp run clear @s minecraft:splash_potion 0
execute as @a[tag=kandy.charm.alchemist] run scoreboard players operation @s alch_potions += @s alch_tmp
execute as @a[tag=kandy.charm.alchemist] store result score @s alch_tmp run clear @s minecraft:lingering_potion 0
execute as @a[tag=kandy.charm.alchemist] run scoreboard players operation @s alch_potions += @s alch_tmp
execute as @a unless entity @s[scores={alch_potions=3..}] run attribute @s minecraft:max_health modifier remove kandy:alchemist
execute as @a[scores={alch_potions=3..}] run attribute @s minecraft:max_health modifier add kandy:alchemist 2 add_value
