function menu (pause)
	--DarkScreen
	if pause then
	local dark = love.graphics.newImage("assets/darkScreen.png")
	love.graphics.draw(dark)
	end
	--GUI
	font = love.graphics.newFont("assets/BrookeS8.ttf" , 200)
	love.graphics.setFont(font)
	love.graphics.rectangle("line", 0, 0, 1024, 768)
	
	love.graphics.print("AUTEURISKA", 120, 80)
	
	font = love.graphics.newFont("assets/BrookeS8.ttf" , 80)
	love.graphics.setFont(font)
	if (not pause) then
		love.graphics.print("START GAME", 336, 352)
		--love.graphics.rectangle("line", 334, 352, 360, 67)
	end
	love.graphics.print("OPTIONS", 408, 432)
	--love.graphics.rectangle("line", 403, 432, 220, 67)
	love.graphics.print("QUIT", 456, 512)
	--love.graphics.rectangle("line", 450, 512, 136, 67)
	
	
	
	function love.mousepressed( x, y)   
		-- START GAME
		if x > 336 and x < 694 and y > 352 and y < 419 then 
			if (not pause) then
				loadStage(1)
			end	
		end
		-- OPTIONS
		if x > 403 and x < 623 and y > 432 and y < 519 then 
			print("OPTIONS!")
		end
		-- QUIT
		if x > 450 and x < 586 and y > 512 and y < 579 then 
			love.event.quit()
		end
	end
end