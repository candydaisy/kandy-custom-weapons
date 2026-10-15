# Shadow decoy at the departure spot: a puff of void that blinds anyone right next to it
particle minecraft:squid_ink ~ ~1 ~ 0.3 0.6 0.3 0.05 30
particle minecraft:portal ~ ~1 ~ 0.4 0.8 0.4 0.5 40
effect give @a[distance=..3,tag=!ecl.warper] minecraft:blindness 1 0
playsound minecraft:entity.illusioner.mirror_move player @a[distance=..16] ~ ~ ~ 1 0.8
