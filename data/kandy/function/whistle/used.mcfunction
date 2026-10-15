# Run as and at a player who just sounded a goat horn. Only the Bloodhound's Whistle counts:
# in the main hand, or in the offhand when the main hand isn't holding another horn
scoreboard players set #ok whis_tmp 0
execute if items entity @s weapon.mainhand *[custom_data~{utility:"BloodhoundWhistle"}] run scoreboard players set #ok whis_tmp 1
execute unless items entity @s weapon.mainhand minecraft:goat_horn if items entity @s weapon.offhand *[custom_data~{utility:"BloodhoundWhistle"}] run scoreboard players set #ok whis_tmp 1
execute if score #ok whis_tmp matches 0 run return 0

# The item's own 30s use cooldown normally stops early use; this is a backstop
scoreboard players add @s whis_cd 0
execute if score @s whis_cd matches 1.. run return 0
scoreboard players set @s whis_cd 600
function kandy:whistle/sonar
