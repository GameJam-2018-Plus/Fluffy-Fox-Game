require 'animation'
function love.load ()
	--Backgroundmusic
	bgm = love.audio.newSource("assets/Queen_of_the_Night.ogg", "stream")
	bgm:seek(185, "seconds")
	love.audio.play(bgm)
	--Background animation
	bg = Animation:new("assets/mainScreenSprite.png", 1024, 768,4)
end

function love.update ( dt )
	--bgm update
	if not bgm:isPlaying() then
		bgm:stop()
		bgm:play()
	end
	--bga update
	bg:update(dt)	
	--exit
    function love.mousepressed( x, y)   
        if x > 200 and x < 500 and y > 600 and y < 700 then 
            love.event.quit()
        end
    end
end

function love.draw()
	--bga draw
	bg:draw()
	--gui sketch
	love.graphics.rectangle("line", 0, 0, 1024, 768)
	love.graphics.rectangle("line", 200, 600, 300, 100)
end	


