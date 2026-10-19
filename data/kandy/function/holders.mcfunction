# Work out once per tick who holds (main hand) or carries (anywhere) each weapon
tag @a remove kandy.main.bloodpact
tag @a remove kandy.main.lingering_soul
tag @a remove kandy.inv.lingering_soul
tag @a remove kandy.inv.bloodpact
tag @a remove kandy.main.swiftwind
tag @a remove kandy.inv.swiftwind
tag @a remove kandy.main.worldbreaker
tag @a remove kandy.inv.worldbreaker
tag @a remove kandy.main.pyroclast
tag @a remove kandy.inv.pyroclast
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
tag @a remove kandy.main.chainwarden
tag @a remove kandy.inv.chainwarden
tag @a remove kandy.main.falconer
tag @a remove kandy.inv.falconer
tag @a remove kandy.main.lifebloom
tag @a remove kandy.inv.lifebloom
tag @a remove kandy.main.warhorn
tag @a remove kandy.inv.warhorn
tag @a remove kandy.main.dragoon
tag @a remove kandy.inv.dragoon
tag @a remove kandy.hold.warhorn
tag @a remove kandy.charm.zephyr
tag @a remove kandy.charm.berserker
tag @a remove kandy.charm.abyssal_pearl
tag @a remove kandy.charm.molten_core
tag @a remove kandy.charm.void_talisman
tag @a remove kandy.charm.alchemist
tag @a remove kandy.charm.phoenix_plume
tag @a remove kandy.charm.merchant_sigil
tag @a remove kandy.charm.watchers_lens
tag @a remove kandy.charm.verdant_sprig
tag @a remove kandy.charm.stormcaller_coil
tag @a remove kandy.charm.deepdelver_lamp
tag @a remove kandy.charm.reapers_knuckle
tag @a remove kandy.charm.hares_foot
tag @a remove kandy.charm.hearthstone
tag @a remove kandy.charm.wayfarers_compass
tag @a remove kandy.charm.prism_mirror
tag @a remove kandy.charm.predators_fang
tag @a remove kandy.charm.moonlit_pendant
tag @a remove kandy.charm.tinkers_whetstone
tag @a remove kandy.charm.enderbrace
tag @a remove kandy.immune

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"BloodPact"}] run tag @s add kandy.main.bloodpact
execute as @a if items entity @s container.* *[custom_data~{ability:"BloodPact"}] run tag @s add kandy.inv.bloodpact
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"BloodPact"}] run tag @s add kandy.inv.bloodpact

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Echo"}] run tag @s add kandy.main.lingering_soul
execute as @a if items entity @s container.* *[custom_data~{ability:"Echo"}] run tag @s add kandy.inv.lingering_soul
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Echo"}] run tag @s add kandy.inv.lingering_soul

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Momentum"}] run tag @s add kandy.main.swiftwind
execute as @a if items entity @s container.* *[custom_data~{ability:"Momentum"}] run tag @s add kandy.inv.swiftwind
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Momentum"}] run tag @s add kandy.inv.swiftwind

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Gravity"}] run tag @s add kandy.main.worldbreaker
execute as @a if items entity @s container.* *[custom_data~{ability:"Gravity"}] run tag @s add kandy.inv.worldbreaker
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Gravity"}] run tag @s add kandy.inv.worldbreaker

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Pyroclast"}] run tag @s add kandy.main.pyroclast
execute as @a if items entity @s container.* *[custom_data~{ability:"Pyroclast"}] run tag @s add kandy.inv.pyroclast
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Pyroclast"}] run tag @s add kandy.inv.pyroclast

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

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Chainwarden"}] run tag @s add kandy.main.chainwarden
execute as @a if items entity @s container.* *[custom_data~{ability:"Chainwarden"}] run tag @s add kandy.inv.chainwarden
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Chainwarden"}] run tag @s add kandy.inv.chainwarden

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Falconer"}] run tag @s add kandy.main.falconer
execute as @a if items entity @s container.* *[custom_data~{ability:"Falconer"}] run tag @s add kandy.inv.falconer
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Falconer"}] run tag @s add kandy.inv.falconer

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Lifebloom"}] run tag @s add kandy.main.lifebloom
execute as @a if items entity @s container.* *[custom_data~{ability:"Lifebloom"}] run tag @s add kandy.inv.lifebloom
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Lifebloom"}] run tag @s add kandy.inv.lifebloom

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Warhorn"}] run tag @s add kandy.main.warhorn
execute as @a if items entity @s container.* *[custom_data~{ability:"Warhorn"}] run tag @s add kandy.inv.warhorn
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Warhorn"}] run tag @s add kandy.inv.warhorn

execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Dragoon"}] run tag @s add kandy.main.dragoon
execute as @a if items entity @s container.* *[custom_data~{ability:"Dragoon"}] run tag @s add kandy.inv.dragoon
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Dragoon"}] run tag @s add kandy.inv.dragoon

# The Warhorn is blown from either hand
execute as @a if items entity @s weapon.mainhand *[custom_data~{ability:"Warhorn"}] run tag @s add kandy.hold.warhorn
execute as @a if items entity @s weapon.offhand *[custom_data~{ability:"Warhorn"}] run tag @s add kandy.hold.warhorn

# Charms work from anywhere in the inventory, offhand included
execute as @a if items entity @s container.* *[custom_data~{charm:"Zephyr"}] run tag @s add kandy.charm.zephyr
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"Zephyr"}] run tag @s add kandy.charm.zephyr
execute as @a if items entity @s container.* *[custom_data~{charm:"Berserker"}] run tag @s add kandy.charm.berserker
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"Berserker"}] run tag @s add kandy.charm.berserker
execute as @a if items entity @s container.* *[custom_data~{charm:"AbyssalPearl"}] run tag @s add kandy.charm.abyssal_pearl
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"AbyssalPearl"}] run tag @s add kandy.charm.abyssal_pearl
execute as @a if items entity @s container.* *[custom_data~{charm:"MoltenCore"}] run tag @s add kandy.charm.molten_core
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"MoltenCore"}] run tag @s add kandy.charm.molten_core
execute as @a if items entity @s container.* *[custom_data~{charm:"VoidTalisman"}] run tag @s add kandy.charm.void_talisman
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"VoidTalisman"}] run tag @s add kandy.charm.void_talisman
execute as @a if items entity @s container.* *[custom_data~{charm:"AlchemistCatalyst"}] run tag @s add kandy.charm.alchemist
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"AlchemistCatalyst"}] run tag @s add kandy.charm.alchemist

execute as @a if items entity @s container.* *[custom_data~{charm:"PhoenixPlume"}] run tag @s add kandy.charm.phoenix_plume
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"PhoenixPlume"}] run tag @s add kandy.charm.phoenix_plume
execute as @a if items entity @s container.* *[custom_data~{charm:"MerchantSigil"}] run tag @s add kandy.charm.merchant_sigil
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"MerchantSigil"}] run tag @s add kandy.charm.merchant_sigil
execute as @a if items entity @s container.* *[custom_data~{charm:"WatchersLens"}] run tag @s add kandy.charm.watchers_lens
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"WatchersLens"}] run tag @s add kandy.charm.watchers_lens
execute as @a if items entity @s container.* *[custom_data~{charm:"VerdantSprig"}] run tag @s add kandy.charm.verdant_sprig
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"VerdantSprig"}] run tag @s add kandy.charm.verdant_sprig
execute as @a if items entity @s container.* *[custom_data~{charm:"StormcallerCoil"}] run tag @s add kandy.charm.stormcaller_coil
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"StormcallerCoil"}] run tag @s add kandy.charm.stormcaller_coil
execute as @a if items entity @s container.* *[custom_data~{charm:"DeepdelverLamp"}] run tag @s add kandy.charm.deepdelver_lamp
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"DeepdelverLamp"}] run tag @s add kandy.charm.deepdelver_lamp
execute as @a if items entity @s container.* *[custom_data~{charm:"ReapersKnuckle"}] run tag @s add kandy.charm.reapers_knuckle
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"ReapersKnuckle"}] run tag @s add kandy.charm.reapers_knuckle
execute as @a if items entity @s container.* *[custom_data~{charm:"HaresFoot"}] run tag @s add kandy.charm.hares_foot
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"HaresFoot"}] run tag @s add kandy.charm.hares_foot
execute as @a if items entity @s container.* *[custom_data~{charm:"Hearthstone"}] run tag @s add kandy.charm.hearthstone
execute as @a if items entity @s weapon.offhand *[custom_data~{charm:"Hearthstone"}] run tag @s add kandy.charm.hearthstone
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

# Creative/spectator players can't be pulled
tag @a[gamemode=creative] add kandy.immune
tag @a[gamemode=spectator] add kandy.immune
