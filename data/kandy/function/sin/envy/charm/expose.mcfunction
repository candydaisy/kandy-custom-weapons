# Advancement reward: the player hurt a Marked creature. Exposed: your own Marks take +2 damage from your hits
advancement revoke @s only kandy:sin/envy/expose
execute unless entity @s[tag=kandy.envy.c] run return 0
# Our own bonus damage (and Covet's drain) counts as a hit too
execute if entity @s[tag=kandy.wat_busy] run return 0
tag @s add kandy.wat_busy
tag @s add kandy.attacker
scoreboard players operation #me wat_t = @s ecl_pid
execute as @e[distance=..64,scores={wat_mt=1..},nbt={HurtTime:10s}] if score @s wat_by = #me wat_t if function kandy:util/hurt_by_attacker run damage @s 2 kandy:envy_covet by @p[tag=kandy.wat_busy]
tag @s remove kandy.attacker
tag @s remove kandy.wat_busy
