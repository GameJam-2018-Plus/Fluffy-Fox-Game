function stage_2()
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
	
	local actors = {}
	table.insert(actors, Actor:new(100,550,'lego', 666,3,2,Hitbox:new(75,50,50,140),Hitbox:new(140,50,60,100),enemy_sounds))
	table.insert(actors, Actor:new(800, 400, 'tire', 0,2,3,Hitbox:new(50,50,50,50),Hitbox:new(50,50,50,50),enemy_sounds))
	table.insert(actors, Actor:new(1000, 500, 'oven', 0,2,8,Hitbox:new(0,0,200,200),Hitbox:new(50,50,50,50),enemy_sounds))

	local bg = Animation:new("assets/bg/stage_2.png", 4608, 768,1)
        table.insert(actors, Actor:new(0,500,'player',666,3,1,Hitbox:new(75,50,50,140),Hitbox:new(140,50,60,100),player_sounds))
        return Stage:new("assets/audio/Dungeons.ogg", bg, 200, actors)
end
