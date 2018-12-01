require 'animation'
require 'stage'
function love.load ()
	--Backgroundmusic
    local bg = Animation:new("assets/mainScreenSprite.png", 1024, 768,4)
    local actors = {}
    table.insert(actors, Actor:new(10,10,"image","stuff","stuff","stuff","stuff"))
    stage = Stage:new("assets/Queen_of_the_Night.ogg", bg, 200, actors)
	-- bgm = love.audio.newSource("assets/Queen_of_the_Night.ogg", "stream")
	-- bgm:seek(185, "seconds")
	-- love.audio.play(bgm)
	--Background animation	
end

function love.update ( dt )
	--bgm update
	-- if not bgm:isPlaying() then
	-- 	bgm:stop()
	-- 	bgm:play()
	-- end
	--bga update
	-- bg:update(dt)	
    stage:update(dt)
	--exit
    function love.mousepressed( x, y)   
        if x > 200 and x < 500 and y > 600 and y < 700 then 
            love.event.quit()
        end
    end
end

function love.draw()
	--bga draw
	-- bg:draw()
    stage:draw()
	--gui sketch
	love.graphics.rectangle("line", 0, 0, 1024, 768)
	love.graphics.rectangle("line", 200, 600, 300, 100)
end	


