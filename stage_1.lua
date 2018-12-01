function stage_1()
	local bg = Animation:new("assets/emwtf.png", 1280, 720,1)
        local actors = {}
        table.insert(actors, Actor:new(10,10,"player",5,3,1))
        return Stage:new("assets/test.ogg", bg, 200, actors)
end
