# Run as a carrier: plc_gw = how many 64s of valuables they carry, capped
execute store result score #i plc_tmp if items entity @s container.* #kandy:valuables
execute store result score #o plc_tmp if items entity @s weapon.offhand #kandy:valuables
scoreboard players operation #i plc_tmp += #o plc_tmp
execute store result score #b plc_tmp if items entity @s container.* #kandy:valuable_blocks
execute store result score #o plc_tmp if items entity @s weapon.offhand #kandy:valuable_blocks
scoreboard players operation #b plc_tmp += #o plc_tmp
scoreboard players operation #b plc_tmp *= #9 plc_tmp
scoreboard players operation #i plc_tmp += #b plc_tmp
execute store result score #n plc_tmp if items entity @s container.* #kandy:valuable_nuggets
execute store result score #o plc_tmp if items entity @s weapon.offhand #kandy:valuable_nuggets
scoreboard players operation #n plc_tmp += #o plc_tmp
scoreboard players operation #n plc_tmp /= #9 plc_tmp
scoreboard players operation #i plc_tmp += #n plc_tmp
scoreboard players operation #i plc_tmp /= #64 plc_tmp
scoreboard players operation @s plc_gw = #i plc_tmp
execute unless entity @s[tag=kandy.greed.t3] if score @s plc_gw matches 6.. run scoreboard players set @s plc_gw 5
execute if score @s plc_gw matches 8.. run scoreboard players set @s plc_gw 7
