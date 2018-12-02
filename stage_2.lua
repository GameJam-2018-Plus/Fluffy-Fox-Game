function stage_2()
	local bg = Animation:new("assets/bg/stage_2.png", 4608, 768,1)
        local actors = {}
        table.insert(actors, g_player)
        return Stage:new("assets/audio/Dungeon.ogg", bg, 200, actors)
end