function stage_1()
	local player_sounds = {}
	player_sounds.steps = love.audio.newSource("/assets/sound/steps.ogg", "stream")
	player_sounds.hit = love.audio.newSource("/assets/sound/Sword_Noize.ogg","stream")
	player_sounds.ouch = love.audio.newSource("/assets/sound/Crickets.ogg","stream")
	local bg = Animation:new("assets/bg/stage_1/s11.png", 9216, 768,1)
        local actors = {}
        table.insert(actors, Actor:new(0,400,'player',666,3,1,Hitbox:new(75,50,50,140),Hitbox:new(140,50,60,100),player_sounds))
        table.insert(actors, Actor:new(100,400,'lego', 666,3,2,Hitbox:new(75,50,50,140),Hitbox:new(140,50,60,100),player_sounds))
	table.insert(actors, Actor:new(800, 200, 'tire', 0,2,3,Hitbox:new(50,50,50,50),Hitbox:new(50,50,50,50)))
        table.insert(actors, Actor:new(800, 200, 'player', 0,100,4,Hitbox:new(50,50,50,50),Hitbox:new(50,50,50,50)))
        table.insert(actors, Actor:new(-1000, 1000, 'player', 0,1,5,Hitbox:new(0,0,20,7),Hitbox:new(0,0,20,7)))
        return Stage:new("assets/audio/Dungeons.ogg", bg, 200, actors)
end
