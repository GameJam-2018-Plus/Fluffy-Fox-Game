function stage_0()
	local bg = Animation:new("assets/bg/stage_0.png", 1024, 768,0.42)
        local actors = {}
        table.insert(actors, Actor:new(450,350,"player",5,3,1))
        return Stage:new("assets/audio/test.ogg", bg, 200, actors)
end
