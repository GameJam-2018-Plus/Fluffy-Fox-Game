function stage_0()
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
	local bg = Animation:new("assets/bg/stage_0.png", 1024, 768,10)
        local actors = {}
        table.insert(actors, Actor:new(-300,400,'player',666,3,1,Hitbox:new(75,50,50,140),Hitbox:new(140,50,60,100),player_sounds))
        local stage = Stage:new("assets/audio/TitleScreen.ogg", bg, 200, actors)
        stage.music:setVolume(0.25)
        return stage
end
