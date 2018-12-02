require 'hitbox'
local sounds = {}
sounds.steps = love.audio.newSource("/assets/sound/steps.ogg", "stream")
sounds.hit = love.audio.newSource("/assets/sound/Sword_Noize.ogg","stream")
sounds.ouch = love.audio.newSource("/assets/sound/Crickets.ogg","stream")
g_player = Actor:new(0,400,'player',666,3,1,Hitbox:new(75,50,50,140),Hitbox:new(140,50,60,100),sounds)
g_test = Actor:new(100,400,'lego', 666,3,2,Hitbox:new(75,50,50,140),Hitbox:new(140,50,60,100),sounds)
g_circ = Actor:new(800, 200, 'tire', 0,2,3,Hitbox:new(50,50,50,50),Hitbox:new(50,50,50,50))
g_maus = Actor:new(800, 200, 'player', 0,100,4,Hitbox:new(50,50,50,50),Hitbox:new(50,50,50,50))
g_brick = Actor:new(-1000, 1000, 'player', 0,1,5,Hitbox:new(0,0,20,7),Hitbox:new(0,0,20,7))
