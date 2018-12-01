function stage_1()
	local bg = Animation:new("assets/bg/stage_0.png", 4096, 768,1)
        local actors = {}
        table.insert(actors, Actor:new(10,10,"player",5,3,1))
        return Stage:new("assets/audio/test.ogg", bg, 200, actors)
end
