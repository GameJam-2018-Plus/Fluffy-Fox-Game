require 'characters'
function stage_1()
	local bg = Animation:new("assets/bg/stage_0.png", 4096, 768,1)
        local actors = {}
        table.insert(actors, g_player)
        table.insert(actors, g_test)
	table.insert(actors, g_circ)
        table.insert(actors, g_maus)
        table.insert(actors, g_brick)
        return Stage:new("assets/audio/test.ogg", bg, 200, actors)
end
