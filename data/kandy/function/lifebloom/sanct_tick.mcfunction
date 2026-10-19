# Run as and at a player with Sanctuary up: a 5-block aura around them for 10s
scoreboard players remove @s lb_sa 1
scoreboard players operation #m lb_tmp = @s lb_sa
scoreboard players operation #m lb_tmp %= #20 lb_tmp
execute if score #m lb_tmp matches 0 run function kandy:lifebloom/sanct_pulse
particle minecraft:cherry_leaves ~ ~0.3 ~ 2.5 0.1 2.5 0 2
