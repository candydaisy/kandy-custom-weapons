# Advancement reward: chill or shatter whatever the wielder hit
advancement revoke @s only kandy:sin/melancholy/hit
# Shatter and Nova damage count as hits too, so ignore hits made while one is being resolved
execute if entity @s[tag=kandy.frost_busy] run return 0
tag @s add kandy.frost_busy
tag @s add kandy.frost_wielder
function kandy:util/tag_victims
function kandy:sin/tier
scoreboard players operation #wt frost_tmp = @s kandy.wt
# Long Night (set bonus): at night, Shatter also blinds players and refills a Moonlit heart
scoreboard players set #night frost_tmp 0
execute if entity @s[tag=kandy.melancholy.set] if predicate kandy:moonlit_pendant_night run scoreboard players set #night frost_tmp 1

# Solitude: +1 damage (+2 at tier 3) when no other player is within 16 blocks
tag @s add kandy.frost_alone
execute at @s if entity @a[distance=0.01..16,gamemode=!spectator] run tag @s remove kandy.frost_alone
execute if entity @s[tag=kandy.frost_alone] if score #wt frost_tmp matches ..2 as @e[tag=kandy.victim] run damage @s 1 kandy:melancholy_solitude by @p[tag=kandy.frost_wielder]
execute if entity @s[tag=kandy.frost_alone] if score #wt frost_tmp matches 3.. as @e[tag=kandy.victim] run damage @s 2 kandy:melancholy_solitude by @p[tag=kandy.frost_wielder]

# Frozen victims shatter, everyone else gains a Hypothermia stack
scoreboard players set #shat frost_tmp 0
execute as @e[tag=kandy.victim,scores={frost_frozen=1..}] at @s run function kandy:sin/melancholy/weapon/shatter
execute as @e[tag=kandy.victim,tag=!kandy.frost_shattered] at @s run function kandy:sin/melancholy/weapon/add_stack
tag @e[tag=kandy.frost_shattered] remove kandy.frost_shattered
tag @e[tag=kandy.victim] remove kandy.victim

# Frost Nova: sneak-attack, 8s cooldown
execute if predicate kandy:sneaking run function kandy:sin/active {sin:"melancholy"}

# Shatters deepen a tier 1 scythe (tier 2 after 20)
execute if score #shat frost_tmp matches 1.. if score @s kandy.wt matches 1 run function kandy:sin/deed {sin:"melancholy",need:20,what:"Shatters",name:"Melancholy",color:"#afc4e8"}
tag @s remove kandy.frost_alone

tag @s remove kandy.frost_wielder
tag @s remove kandy.frost_busy
