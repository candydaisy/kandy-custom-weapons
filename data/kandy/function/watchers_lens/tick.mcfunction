# Mark cooldown
scoreboard players remove @a[scores={wat_cd=1..}] wat_cd 1
scoreboard players add @a[tag=kandy.charm.watchers_lens] wat_cd 0

# Mark: wat_use is set every tick the lens is scoped (using_item advancement); 1s of scoping marks
scoreboard players add @a wat_use 0
scoreboard players add @a[scores={wat_use=1}] wat_scope 1
scoreboard players set @a[scores={wat_use=0}] wat_scope 0
execute as @a[scores={wat_scope=20..,wat_cd=0}] at @s run function kandy:watchers_lens/mark
scoreboard players set @a[scores={wat_use=1..}] wat_use 0

# Hunter's Sense, twice a second
scoreboard players add #t wat_t 1
execute if score #t wat_t matches 10.. as @a[tag=kandy.charm.watchers_lens] at @s run function kandy:watchers_lens/sense
execute if score #t wat_t matches 10.. run scoreboard players set #t wat_t 0
