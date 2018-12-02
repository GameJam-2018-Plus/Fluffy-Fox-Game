require 'hitbox'
local sounds = {}
sounds.steps = love.audio.newSource("/assets/sound/steps.ogg", "stream")
sounds.hit = love.audio.newSource("/assets/sound/Sword_Noize.ogg","stream")
sounds.ouch = love.audio.newSource("/assets/sound/Crickets.ogg","stream")
g_player = Actor:new(0,400,'player',666,3,1,Hitbox:new(75,50,50,140),Hitbox:new(140,50,60,100),sounds)
g_test = Actor:new(100,400,'player', 666,3,2,Hitbox:new(75,50,50,140),Hitbox:new(140,50,60,100),sounds)
