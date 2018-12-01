require 'animation'
require 'stage'
stage = {}
current_stage = 0
function love.load ()
    loadStage(0)
end

function love.update ( dt )
	
    switch = stage:update(dt)
    if switch ~= -1 then
        loadStage(switch)
    end
	--exit
    function love.mousepressed( x, y)   
        if x > 200 and x < 500 and y > 600 and y < 700 then 
            -- love.event.quit()
            loadStage(1)
        end
    end
end

function love.draw()
	--bga draw
    stage:draw()
	--gui sketch
    if current_stage == 0 then
	    love.graphics.rectangle("line", 0, 0, 1024, 768)
	    love.graphics.rectangle("line", 200, 600, 300, 100)
    end
end	




