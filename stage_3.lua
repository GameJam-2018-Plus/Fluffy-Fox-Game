function stage_3()
	local player_sounds = {}
	player_sounds.steps = love.audio.newSource("/assets/sound/steps.ogg", "stream")
	player_sounds.hit = love.audio.newSource("/assets/sound/Sword_Noize.ogg","stream")
	player_sounds.ouch = love.audio.newSource("/assets/sound/Pain1.ogg","stream")
	player_sounds.direct_hit = love.audio.newSource("/assets/sound/Fight5.ogg","stream")
	player_sounds.death = love.audio.newSource("/assets/sound/Pain3.ogg","stream")
	
	local enemy_sounds = {}
	enemy_sounds.steps = love.audio.newSource("/assets/sound/silence.wav", "stream")
	enemy_sounds.hit = love.audio.newSource("/assets/sound/silence.wav","stream")
	enemy_sounds.ouch = love.audio.newSource("/assets/sound/silence.wav","stream")
	enemy_sounds.direct_hit = love.audio.newSource("/assets/sound/silence.wav","stream")
	enemy_sounds.death = love.audio.newSource("/assets/sound/silence.wav","stream")

	local bg = Animation:new("assets/bg/stage_3.png", 4096, 768,1)
        local actors = {}
        table.insert(actors, Actor:new(0,500,'player',666,3,1,Hitbox:new(75,50,50,140),Hitbox:new(140,50,60,100),player_sounds))
        table.insert(actors, Actor:new(800, 500, 'screw', 0,2,3,Hitbox:new(50,50,50,50),Hitbox:new(50,50,50,50),enemy_sounds))
	table.insert(actors, Actor:new(1500, 550, 'teddy', 0,2,8,Hitbox:new(0,0,200,200),Hitbox:new(50,50,50,50),enemy_sounds))
	table.insert(actors, Actor:new(100, 450, 'screw', 0,2,3,Hitbox:new(50,50,50,50),Hitbox:new(50,50,50,50),enemy_sounds))
	table.insert(actors, Actor:new(400, 550, 'teddy', 0,2,8,Hitbox:new(0,0,200,200),Hitbox:new(50,50,50,50),enemy_sounds))
	table.insert(actors, Actor:new(1300, 300, 'screw', 0,2,3,Hitbox:new(50,50,50,50),Hitbox:new(50,50,50,50),enemy_sounds))
        return Stage:new("assets/audio/Forest.ogg", bg, 200, actors)
end
