# Run as and at the locked target hit by kandy.envy_thief: steal every buff it has
scoreboard players set #n envy_tmp 0
function kandy:sin/envy/weapon/steal {e:"strength"}
function kandy:sin/envy/weapon/steal {e:"speed"}
function kandy:sin/envy/weapon/steal {e:"haste"}
function kandy:sin/envy/weapon/steal {e:"resistance"}
function kandy:sin/envy/weapon/steal {e:"regeneration"}
function kandy:sin/envy/weapon/steal {e:"absorption"}
function kandy:sin/envy/weapon/steal {e:"health_boost"}
function kandy:sin/envy/weapon/steal {e:"jump_boost"}
function kandy:sin/envy/weapon/steal {e:"fire_resistance"}
function kandy:sin/envy/weapon/steal {e:"water_breathing"}
function kandy:sin/envy/weapon/steal {e:"night_vision"}
function kandy:sin/envy/weapon/steal {e:"invisibility"}
function kandy:sin/envy/weapon/steal {e:"slow_falling"}
function kandy:sin/envy/weapon/steal {e:"conduit_power"}
function kandy:sin/envy/weapon/steal {e:"dolphins_grace"}
function kandy:sin/envy/weapon/steal {e:"luck"}
function kandy:sin/envy/weapon/steal {e:"hero_of_the_village"}
execute if score #n envy_tmp matches 0 run return 0
particle minecraft:happy_villager ~ ~1 ~ 0.3 0.5 0.3 0 8
particle minecraft:dust{color:[0.3,0.7,0.3],scale:1.0f} ~ ~1 ~ 0.4 0.6 0.4 0 16
execute at @p[tag=kandy.envy_thief] run particle minecraft:happy_villager ~ ~1 ~ 0.3 0.5 0.3 0 8
