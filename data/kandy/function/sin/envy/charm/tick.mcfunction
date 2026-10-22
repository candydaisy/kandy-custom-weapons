# Mark cooldown
scoreboard players remove @a[scores={wat_cd=1..}] wat_cd 1
scoreboard players add @a[tag=kandy.envy.c] wat_cd 0

# Mark: wat_use is set every tick the lens is scoped (using_item advancement); 1s of scoping marks
scoreboard players add @a wat_use 0
scoreboard players add @a[scores={wat_use=1}] wat_scope 1
scoreboard players set @a[scores={wat_use=0}] wat_scope 0
execute as @a[tag=kandy.envy.c,scores={wat_scope=20..,wat_cd=0}] at @s run function kandy:sin/envy/charm/mark
scoreboard players set @a[scores={wat_use=1..}] wat_use 0

# Hunter's Sense, twice a second
scoreboard players add #t wat_t 1
execute if score #t wat_t matches 10.. as @a[tag=kandy.envy.c] at @s run function kandy:sin/envy/charm/sense
execute if score #t wat_t matches 10.. run scoreboard players set #t wat_t 0

# A Mark lasts 10s (Spite: the Recurve locks onto your own Marks at once)
scoreboard players remove @e[scores={wat_mt=1..}] wat_mt 1

# Green Eye: -1 armor for each player within 16 blocks with more health than you (max -4). Only re-applied when it changes
scoreboard players set @a wat_ge 0
execute as @a[tag=kandy.envy.c] at @s run function kandy:sin/envy/charm/envious
execute as @a unless score @s wat_ge = @s wat_gep run function kandy:sin/envy/charm/green_eye
