function stage_3()
	local bg = Animation:new("assets/bg/stage_3.png", 4096, 768,1)
        local actors = {}
        table.insert(actors, Actor:new(10,10,"image","stuff","stuff","stuff","stuff"))
        return Stage:new("assets/audio/test.ogg", bg, 200, actors)
end