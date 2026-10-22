# Run this, then disable the pack with /datapack disable
function kandy:hud/uninstall
function kandy:team/uninstall
execute as @a run attribute @s minecraft:attack_speed modifier remove kandy:momentum
execute as @a run attribute @s minecraft:entity_interaction_range modifier remove kandy:momentum
execute as @a run attribute @s minecraft:attack_damage modifier remove minecraft:blood_dmg
execute as @a run attribute @s minecraft:attack_speed modifier remove minecraft:momentum
execute as @a run attribute @s minecraft:entity_interaction_range modifier remove minecraft:momentum
execute as @e[scores={pyro_melt=0..}] run attribute @s minecraft:armor modifier remove kandy:melt

scoreboard objectives remove sprint
scoreboard objectives remove echo_timer
scoreboard objectives remove echo_stacks
scoreboard objectives remove echo_owner
scoreboard objectives remove soul_pid
scoreboard objectives remove blood_hit
scoreboard objectives remove blood_bleed
scoreboard objectives remove hp
scoreboard objectives remove grav_pull
scoreboard objectives remove grav_hit
scoreboard objectives remove grav_vtx
scoreboard objectives remove grav_cd
scoreboard objectives remove grav_snk
scoreboard objectives remove grav_prev
scoreboard objectives remove sneak
scoreboard objectives remove pyro_heat
scoreboard objectives remove pyro_idle
scoreboard objectives remove pyro_od
scoreboard objectives remove pyro_cd
scoreboard objectives remove pyro_melt
scoreboard objectives remove pyro_tmp
scoreboard objectives remove pyro_oh

advancement revoke @a only kandy:hit/lingering_soul
advancement revoke @a only kandy:hit/worldbreaker
function kandy:sin/uninstall

function kandy:tempest/uninstall
function kandy:frostveil/uninstall
scoreboard objectives remove frost_chill
function kandy:eclipse/uninstall
function kandy:chronos/uninstall
function kandy:abyssal/uninstall
function kandy:lifebloom/uninstall
function kandy:warhorn/uninstall
function kandy:zephyr/uninstall
function kandy:abyssal_pearl/uninstall
function kandy:molten_core/uninstall
function kandy:void_talisman/uninstall
function kandy:alchemist/uninstall
function kandy:merchant_sigil/uninstall
function kandy:verdant_sprig/uninstall
function kandy:stormcaller_coil/uninstall
function kandy:deepdelver_lamp/uninstall
function kandy:reapers_knuckle/uninstall
function kandy:hearthstone/uninstall
function kandy:wayfarers_compass/uninstall
function kandy:prism_mirror/uninstall
function kandy:predators_fang/uninstall
function kandy:moonlit_pendant/uninstall
function kandy:tinkers_whetstone/uninstall
function kandy:enderbrace/uninstall
function kandy:anglers_lure/uninstall
function kandy:harvesters_sheaf/uninstall
function kandy:slayers_tally/uninstall
function kandy:beastmasters_whistle/uninstall
function kandy:wardlight_lantern/uninstall

tellraw @a "Kandy uninstalled. Now run /datapack disable on this pack."
