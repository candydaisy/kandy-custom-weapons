scoreboard players remove @a[scores={mer_cd=1..}] mer_cd 1

# Every 2s: refresh Guild Favor and push nearby raiders
scoreboard players add #t mer_t 1
execute if score #t mer_t matches 40.. run function kandy:merchant_sigil/pulse
