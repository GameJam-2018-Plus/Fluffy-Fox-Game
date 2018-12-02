function stage_2()
	local player_sounds = {}
	player_sounds.steps = love.audio.newSource("/assets/sound/steps.ogg", "stream")
	player_sounds.hit = love.audio.newSource("/assets/sound/Sword_Noize.ogg","stream")
	player_sounds.ouch = love.audio.newSource("/assets/sound/Crickets.ogg","stream")
	local bg = Animation:new("assets/bg/stage_2.png", 4608, 768,1)
        local actors = {}
        table.insert(actors, Actor:new(0,400,'player',666,3,1,Hitbox:new(75,50,50,140),Hitbox:new(140,50,60,100),player_sounds))
        return Stage:new("assets/audio/Dungeon.ogg", bg, 200, actors)
end
