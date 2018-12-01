function stage_0()
	local bg = Animation:new("assets/mainScreenSprite.png", 1024, 768,0.5)
    local actors = {}
    table.insert(actors, Actor:new(10,10,"image","stuff","stuff","stuff","stuff"))
    return Stage:new("assets/Queen_of_the_Night.ogg", bg, 200, actors)
end