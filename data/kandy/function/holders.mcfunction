# Work out once per tick who holds (main hand) or carries (anywhere) each weapon
tag @a remove kandy.main.worldbreaker
tag @a remove kandy.inv.worldbreaker
tag @a remove kandy.main.tempest
tag @a remove kandy.inv.tempest
tag @a remove kandy.main.frostveil
tag @a remove kandy.inv.frostveil
tag @a remove kandy.main.eclipse
tag @a remove kandy.inv.eclipse
tag @a remove kandy.main.chronos
tag @a remove kandy.inv.chronos
tag @a remove kandy.main.abyssal
tag @a remove kandy.inv.abyssal
tag @a remove kandy.off.abyssal
tag @a remove kandy.main.lifebloom
tag @a remove kandy.inv.lifebloom
tag @a remove kandy.main.warhorn
tag @a remove kandy.inv.warhorn
tag @a remove kandy.hold.warhorn
tag @a remove kandy.charm.zephyr
tag @a remove kandy.charm.abyssal_pearl
tag @a remove kandy.charm.molten_core
tag @a remove kandy.charm.void_talisman
tag @a remove kandy.charm.alchemist
tag @a remove kandy.charm.merchant_sigil
tag @a remove kandy.charm.verdant_sprig
tag @a remove kandy.charm.stormcaller_coil
tag @a remove kandy.charm.deepdelver_lamp
tag @a remove kandy.charm.reapers_knuckle
tag @a remove kandy.charm.wayfarers_compass
tag @a remove kandy.charm.prism_mirror
tag @a remove kandy.charm.predators_fang
tag @a remove kandy.charm.moonlit_pendant
tag @a remove kandy.charm.tinkers_whetstone
tag @a remove kandy.charm.enderbrace
tag @a remove kandy.charm.anglers_lure
tag @a remove kandy.charm.harvesters_sheaf
tag @a remove kandy.charm.slayers_tally
tag @a remove kandy.charm.beastmasters_whistle
tag @a remove kandy.charm.wardlight_lantern
tag @a remove kandy.immune


execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Gravity"}] run tag @s add kandy.main.worldbreaker
execute as @a if items entity @s container.* *[custom_data~{ability:"Gravity"}] run tag @s add kandy.inv.worldbreaker
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Gravity"}] run tag @s add kandy.inv.worldbreaker

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Tempest"}] run tag @s add kandy.main.tempest
execute as @a if items entity @s container.* *[custom_data~{ability:"Tempest"}] run tag @s add kandy.inv.tempest
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Tempest"}] run tag @s add kandy.inv.tempest

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Frostveil"}] run tag @s add kandy.main.frostveil
execute as @a if items entity @s container.* *[custom_data~{ability:"Frostveil"}] run tag @s add kandy.inv.frostveil
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Frostveil"}] run tag @s add kandy.inv.frostveil

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Eclipse"}] run tag @s add kandy.main.eclipse
execute as @a if items entity @s container.* *[custom_data~{ability:"Eclipse"}] run tag @s add kandy.inv.eclipse
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Eclipse"}] run tag @s add kandy.inv.eclipse

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Chronos"}] run tag @s add kandy.main.chronos
execute as @a if items entity @s container.* *[custom_data~{ability:"Chronos"}] run tag @s add kandy.inv.chronos
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Chronos"}] run tag @s add kandy.inv.chronos

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Abyssal"}] run tag @s add kandy.main.abyssal
execute as @a if items entity @s container.* *[custom_data~{ability:"Abyssal"}] run tag @s add kandy.inv.abyssal
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Abyssal"}] run tag @s add kandy.inv.abyssal

# Shields are usually held in the offhand
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Abyssal"}] run tag @s add kandy.off.abyssal


execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Lifebloom"}] run tag @s add kandy.main.lifebloom
execute as @a if items entity @s container.* *[custom_data~{ability:"Lifebloom"}] run tag @s add kandy.inv.lifebloom
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Lifebloom"}] run tag @s add kandy.inv.lifebloom

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Warhorn"}] run tag @s add kandy.main.warhorn
execute as @a if items entity @s container.* *[custom_data~{ability:"Warhorn"}] run tag @s add kandy.inv.warhorn
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Warhorn"}] run tag @s add kandy.inv.warhorn

# The Warhorn is blown from either hand
execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Warhorn"}] run tag @s add kandy.hold.warhorn
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Warhorn"}] run tag @s add kandy.hold.warhorn

# Charms work from anywhere in the inventory, offhand included
execute as @a if items entity @s container.* *[custom_data~{charm:"Zephyr"}] run tag @s add kandy.charm.zephyr
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"Zephyr"}] run tag @s add kandy.charm.zephyr
execute as @a if items entity @s container.* *[custom_data~{charm:"AbyssalPearl"}] run tag @s add kandy.charm.abyssal_pearl
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"AbyssalPearl"}] run tag @s add kandy.charm.abyssal_pearl
execute as @a if items entity @s container.* *[custom_data~{charm:"MoltenCore"}] run tag @s add kandy.charm.molten_core
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"MoltenCore"}] run tag @s add kandy.charm.molten_core
execute as @a if items entity @s container.* *[custom_data~{charm:"VoidTalisman"}] run tag @s add kandy.charm.void_talisman
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"VoidTalisman"}] run tag @s add kandy.charm.void_talisman
execute as @a if items entity @s container.* *[custom_data~{charm:"AlchemistCatalyst"}] run tag @s add kandy.charm.alchemist
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"AlchemistCatalyst"}] run tag @s add kandy.charm.alchemist

execute as @a if items entity @s container.* *[custom_data~{charm:"MerchantSigil"}] run tag @s add kandy.charm.merchant_sigil
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"MerchantSigil"}] run tag @s add kandy.charm.merchant_sigil
execute as @a if items entity @s container.* *[custom_data~{charm:"VerdantSprig"}] run tag @s add kandy.charm.verdant_sprig
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"VerdantSprig"}] run tag @s add kandy.charm.verdant_sprig
execute as @a if items entity @s container.* *[custom_data~{charm:"StormcallerCoil"}] run tag @s add kandy.charm.stormcaller_coil
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"StormcallerCoil"}] run tag @s add kandy.charm.stormcaller_coil
execute as @a if items entity @s container.* *[custom_data~{charm:"DeepdelverLamp"}] run tag @s add kandy.charm.deepdelver_lamp
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"DeepdelverLamp"}] run tag @s add kandy.charm.deepdelver_lamp
execute as @a if items entity @s container.* *[custom_data~{charm:"ReapersKnuckle"}] run tag @s add kandy.charm.reapers_knuckle
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"ReapersKnuckle"}] run tag @s add kandy.charm.reapers_knuckle
execute as @a if items entity @s container.* *[custom_data~{charm:"WayfarersCompass"}] run tag @s add kandy.charm.wayfarers_compass
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"WayfarersCompass"}] run tag @s add kandy.charm.wayfarers_compass
execute as @a if items entity @s container.* *[custom_data~{charm:"PrismMirror"}] run tag @s add kandy.charm.prism_mirror
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"PrismMirror"}] run tag @s add kandy.charm.prism_mirror
execute as @a if items entity @s container.* *[custom_data~{charm:"PredatorsFang"}] run tag @s add kandy.charm.predators_fang
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"PredatorsFang"}] run tag @s add kandy.charm.predators_fang
execute as @a if items entity @s container.* *[custom_data~{charm:"MoonlitPendant"}] run tag @s add kandy.charm.moonlit_pendant
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"MoonlitPendant"}] run tag @s add kandy.charm.moonlit_pendant
execute as @a if items entity @s container.* *[custom_data~{charm:"TinkersWhetstone"}] run tag @s add kandy.charm.tinkers_whetstone
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"TinkersWhetstone"}] run tag @s add kandy.charm.tinkers_whetstone
execute as @a if items entity @s container.* *[custom_data~{charm:"Enderbrace"}] run tag @s add kandy.charm.enderbrace
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"Enderbrace"}] run tag @s add kandy.charm.enderbrace
execute as @a if items entity @s container.* *[custom_data~{charm:"AnglersLure"}] run tag @s add kandy.charm.anglers_lure
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"AnglersLure"}] run tag @s add kandy.charm.anglers_lure
execute as @a if items entity @s container.* *[custom_data~{charm:"HarvestersSheaf"}] run tag @s add kandy.charm.harvesters_sheaf
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"HarvestersSheaf"}] run tag @s add kandy.charm.harvesters_sheaf
execute as @a if items entity @s container.* *[custom_data~{charm:"SlayersTally"}] run tag @s add kandy.charm.slayers_tally
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"SlayersTally"}] run tag @s add kandy.charm.slayers_tally
execute as @a if items entity @s container.* *[custom_data~{charm:"BeastmastersWhistle"}] run tag @s add kandy.charm.beastmasters_whistle
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"BeastmastersWhistle"}] run tag @s add kandy.charm.beastmasters_whistle
execute as @a if items entity @s container.* *[custom_data~{charm:"WardlightLantern"}] run tag @s add kandy.charm.wardlight_lantern
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"WardlightLantern"}] run tag @s add kandy.charm.wardlight_lantern

# Creative/spectator players can't be pulled
tag @a[gamemode=creative] add kandy.immune
tag @a[gamemode=spectator] add kandy.immune
