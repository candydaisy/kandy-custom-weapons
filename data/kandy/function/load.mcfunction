tellraw @a "Kandy Loaded!!"
function kandy:swiftwind/setup
function kandy:lingering_soul/setup
function kandy:bloodpact/setup
function kandy:worldbreaker/setup

# Clean up modifiers left behind by older versions of the pack
execute as @a run attribute @s minecraft:attack_damage modifier remove minecraft:blood_dmg
execute as @a run attribute @s minecraft:attack_speed modifier remove minecraft:momentum
execute as @a run attribute @s minecraft:entity_interaction_range modifier remove minecraft:momentum
