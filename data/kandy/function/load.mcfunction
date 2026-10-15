tellraw @a [{"text":"Kandy Loaded!! "},{"text":"[Open menu]","color":"light_purple","click_event":{"action":"run_command","command":"/function kandy:menu"},"hover_event":{"action":"show_text","value":"Weapons and cores, one click away"}}]
function kandy:swiftwind/setup
function kandy:lingering_soul/setup
function kandy:bloodpact/setup
function kandy:worldbreaker/setup
function kandy:pyroclast/setup
function kandy:tempest/setup
function kandy:frostveil/setup
function kandy:eclipse/setup
function kandy:chronos/setup
function kandy:abyssal/setup
function kandy:zephyr/setup
function kandy:berserker/setup
function kandy:abyssal_pearl/setup
function kandy:molten_core/setup
function kandy:void_talisman/setup
function kandy:alchemist/setup

# A hit advancement stays granted if its reward function failed to run, which disables that weapon
advancement revoke @a only kandy:hit/bloodpact
advancement revoke @a only kandy:hit/lingering_soul
advancement revoke @a only kandy:hit/worldbreaker
advancement revoke @a only kandy:hit/pyroclast
advancement revoke @a only kandy:hit/tempest
advancement revoke @a only kandy:hit/frostveil
advancement revoke @a only kandy:hit/eclipse
advancement revoke @a only kandy:hit/chronos
advancement revoke @a only kandy:hit/abyssal

# Clean up modifiers left behind by older versions of the pack
execute as @a run attribute @s minecraft:attack_damage modifier remove minecraft:blood_dmg
execute as @a run attribute @s minecraft:attack_speed modifier remove minecraft:momentum
execute as @a run attribute @s minecraft:entity_interaction_range modifier remove minecraft:momentum
