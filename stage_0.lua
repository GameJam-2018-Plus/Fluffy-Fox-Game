function stage_0()
	local bg = Animation:new("assets/mainScreenSprite.png", 2048, 768,4)
        local actors = {}
        table.insert(actors, Actor:new(450,350,"player",5,3,1))
        return Stage:new("assets/Queen_of_the_Night.ogg", bg, 200, actors)
end
