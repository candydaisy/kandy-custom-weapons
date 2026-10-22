tellraw @a [{"text":"Kandy Loaded!! "},{"text":"[Open menu]","color":"light_purple","click_event":{"action":"run_command","command":"/function kandy:menu"},"hover_event":{"action":"show_text","value":"Weapons and cores, one click away"}}]
function kandy:hud/setup
function kandy:team/setup
function kandy:worldbreaker/setup
function kandy:sin/setup
function kandy:tempest/setup
function kandy:frostveil/setup
function kandy:eclipse/setup
function kandy:chronos/setup
function kandy:abyssal/setup
function kandy:lifebloom/setup
function kandy:warhorn/setup
function kandy:zephyr/setup
function kandy:abyssal_pearl/setup
function kandy:molten_core/setup
function kandy:void_talisman/setup
function kandy:alchemist/setup
function kandy:merchant_sigil/setup
function kandy:verdant_sprig/setup
function kandy:stormcaller_coil/setup
function kandy:deepdelver_lamp/setup
function kandy:reapers_knuckle/setup
function kandy:wayfarers_compass/setup
function kandy:prism_mirror/setup
function kandy:predators_fang/setup
function kandy:moonlit_pendant/setup
function kandy:tinkers_whetstone/setup
function kandy:enderbrace/setup
function kandy:anglers_lure/setup
function kandy:harvesters_sheaf/setup
function kandy:slayers_tally/setup
function kandy:beastmasters_whistle/setup
function kandy:wardlight_lantern/setup

# A hit advancement stays granted if its reward function failed to run, which disables that weapon
advancement revoke @a only kandy:sin/lust/hit
advancement revoke @a only kandy:sin/lust/hurt
advancement revoke @a only kandy:sin/lust/using
advancement revoke @a only kandy:sin/lust/kill
advancement revoke @a only kandy:hit/worldbreaker
advancement revoke @a only kandy:sin/wrath/hit
advancement revoke @a only kandy:sin/wrath/hurt
advancement revoke @a only kandy:sin/wrath/kill
advancement revoke @a only kandy:hit/tempest
advancement revoke @a only kandy:hit/frostveil
advancement revoke @a only kandy:hit/eclipse
advancement revoke @a only kandy:hit/chronos
advancement revoke @a only kandy:sin/greed/hit
advancement revoke @a only kandy:sin/greed/kill
advancement revoke @a only kandy:sin/greed/plunder
advancement revoke @a only kandy:hit/lifebloom
advancement revoke @a only kandy:sin/pride/hit
advancement revoke @a only kandy:sin/pride/using
advancement revoke @a only kandy:sin/envy/hit
advancement revoke @a only kandy:sin/envy/kill
advancement revoke @a only kandy:sin/envy/expose
advancement revoke @a only kandy:sin/gluttony/hit
advancement revoke @a only kandy:sin/gluttony/using
advancement revoke @a only kandy:sin/gluttony/kill
advancement revoke @a only kandy:sin/gluttony/feast
advancement revoke @a only kandy:sin/gluttony/ate

# Clean up modifiers left behind by older versions of the pack
execute as @a run attribute @s minecraft:attack_damage modifier remove minecraft:blood_dmg
execute as @a run attribute @s minecraft:attack_speed modifier remove minecraft:momentum
execute as @a run attribute @s minecraft:entity_interaction_range modifier remove minecraft:momentum
