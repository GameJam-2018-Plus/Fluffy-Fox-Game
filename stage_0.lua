require 'characters'
function stage_0()
	local bg = Animation:new("assets/bg/stage_0.png", 1024, 768,10)
        local actors = {}
        table.insert(actors, g_player)
        return Stage:new("assets/audio/test.ogg", bg, 200, actors)
end
