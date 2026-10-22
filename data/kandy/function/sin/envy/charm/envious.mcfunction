# Run as and at a Lens carrier: count the players nearby who are healthier than you
tag @s add kandy.wat_self
execute as @a[distance=..16,tag=!kandy.wat_self,gamemode=!spectator] if score @s hp > @p[tag=kandy.wat_self] hp run scoreboard players add @p[tag=kandy.wat_self] wat_ge 1
tag @s remove kandy.wat_self
scoreboard players set @s[scores={wat_ge=5..}] wat_ge 4
