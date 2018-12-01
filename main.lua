require 'animation'
require 'stage'
require 'menu'
stage = {}
current_stage = 0
PAUSE = false

function love.load ()
    loadStage(0)
end

function love.update ( dt )
	if love.keyboard.isDown("escape") and current_stage ~= 0 then
		PAUSE = not PAUSE
		love.timer.sleep(.42)
	end
	if not PAUSE then	
		switch = stage:update(dt)
		if switch ~= -1 then
			loadStage(switch)
		end
	end	
	collectgarbage()
end

function love.draw()
	--bga draw
    stage:draw()
	--gui sketch
    if current_stage == 0 or PAUSE then
		--menu(PAUSE)
	end
	if current_stage ~= 0 and not PAUSE then
		function love.mousepressed( x, y) 
		end
    end
	
end	




