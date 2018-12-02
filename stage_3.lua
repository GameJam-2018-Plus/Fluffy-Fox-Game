function stage_3()
	local bg = Animation:new("assets/bg/stage_3.png", 4096, 768,1)
        local actors = {}
        table.insert(actors, g_player)
        return Stage:new("assets/audio/Forest.ogg", bg, 200, actors)
end