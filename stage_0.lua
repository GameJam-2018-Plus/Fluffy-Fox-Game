require 'characters'
function stage_0()
	local bg = Animation:new("assets/bg/stage_0.png", 1024, 768,10)
        local actors = {}
        table.insert(actors, g_player)
        local stage = Stage:new("assets/audio/TitleScreen.ogg", bg, 200, actors)
        stage.music:setVolume(0.25)
        return stage
end
