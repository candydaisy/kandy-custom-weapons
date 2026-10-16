execute as @a[scores={bers_fr=1..}] at @s run particle minecraft:dust{color:[1.0,0.0,0.2],scale:1.0} ~ ~1 ~ 0.4 0.6 0.4 0 3
execute as @a[scores={bers_fr=1..}] at @s run particle minecraft:angry_villager ~ ~1.8 ~ 0.4 0.3 0.4 0 0

# Heartbeat once a second during Frenzy
execute as @a[scores={bers_fr=1..}] run scoreboard players operation @s bers_tmp = @s bers_fr
execute as @a[scores={bers_fr=1..}] run scoreboard players operation @s bers_tmp %= #20 bers_tmp
execute as @a[scores={bers_fr=1..,bers_tmp=0}] at @s run playsound minecraft:entity.warden.heartbeat player @s ~ ~ ~ 1 1.3

# Actionbar, unless a Kandy weapon's own bar is showing
execute as @a[scores={bers_fr=1..},tag=!kandy.main.swiftwind,tag=!kandy.main.bloodpact,tag=!kandy.main.worldbreaker,tag=!kandy.main.pyroclast,tag=!kandy.main.tempest,tag=!kandy.main.frostveil,tag=!kandy.main.eclipse,tag=!kandy.main.chronos,tag=!kandy.main.abyssal] run title @s actionbar [{"text":"✦ BATTLE FRENZY ✦ ","color":"red","bold":true},{"text":"— Blood for blood","color":"gold","italic":true}]
execute as @a[tag=kandy.charm.berserker,scores={bers_fr=0,bers_cd=1..},tag=!kandy.main.swiftwind,tag=!kandy.main.bloodpact,tag=!kandy.main.worldbreaker,tag=!kandy.main.pyroclast,tag=!kandy.main.tempest,tag=!kandy.main.frostveil,tag=!kandy.main.eclipse,tag=!kandy.main.chronos,tag=!kandy.main.abyssal] run title @s actionbar [{"text":"Frenzy recharging","color":"dark_gray","italic":true}]
