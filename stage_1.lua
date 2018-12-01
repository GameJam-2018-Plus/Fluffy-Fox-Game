function stage_1()
	local bg = Animation:new("assets/emwtf.png", 1280, 720,1)
        local actors = {}
        table.insert(actors, Actor:new(10,10,"image","stuff","stuff","stuff","stuff"))
        return Stage:new("assets/Queen_of_the_Night.ogg", bg, 200, actors)
end