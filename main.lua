function love.load ()
	--Backgroundmusic
	bgm = love.audio.newSource("assets/Queen_of_the_Night.ogg", "stream")
	bgm:seek(185, "seconds")
	love.audio.play(bgm)
	--Backgroundanimation
	animation = newAnimation(love.graphics.newImage("assets/mainScreenSprite.png"), 1024, 768,0.5)
end

function love.update ( dt )
	--bgm update
	if not bgm:isPlaying() then
		bgm:stop()
		bgm:play()
	end
	--bga update
	animation.currentTime = animation.currentTime + dt
    if animation.currentTime >= animation.duration then
        animation.currentTime = animation.currentTime - animation.duration
    end
	--exit
    function love.mousepressed( x, y)   
        if x > 200 and x < 500 and y > 600 and y < 700 then 
            love.event.quit()
        end
    end
end

function love.draw()
	--bga draw
	 local spriteNum = math.floor(animation.currentTime / animation.duration * #animation.quads) + 1
    love.graphics.draw(animation.spriteSheet, animation.quads[spriteNum])
	--gui sketch
	love.graphics.rectangle("line", 0, 0, 1024, 768)
	love.graphics.rectangle("line", 200, 600, 300, 100)
end	

function newAnimation(image, width, height, duration)
    local animation = {}
    animation.spriteSheet = image;
    animation.quads = {};
 
    for y = 0, image:getHeight() - height, height do
        for x = 0, image:getWidth() - width, width do
            table.insert(animation.quads, love.graphics.newQuad(x, y, width, height, image:getDimensions()))
        end
    end
	
	animation.duration = duration or 1
    animation.currentTime = 0
 
    return animation
end

