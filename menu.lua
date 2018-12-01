function menu (pause)
	--DarkScreen
	if pause then
	local dark = love.graphics.newImage("assets/bg/pauseScreen.png")
	love.graphics.draw(dark)
	end
	if not show_option then
		--GUI
		font = love.graphics.newFont("assets/fonts/BrookeS8.ttf" , 200)
		love.graphics.setFont(font)
		love.graphics.rectangle("line", 0, 0, 1024, 768)
		
		love.graphics.print("AUTEURISKA", 120, 80)
		
		font = love.graphics.newFont("assets/fonts/BrookeS8.ttf" , 80)
		love.graphics.setFont(font)
		if (not pause) then
			love.graphics.print("START GAME", 336, 352)
			--love.graphics.rectangle("line", 334, 352, 360, 67)
		end
		love.graphics.print("OPTIONS", 408, 432)
		--love.graphics.rectangle("line", 403, 432, 220, 67)
		love.graphics.print("QUIT", 456, 512)
		--love.graphics.rectangle("line", 450, 512, 136, 67)
	else
		font = love.graphics.newFont("assets/fonts/BrookeS8.ttf" , 200)
		love.graphics.setFont(font)
		love.graphics.rectangle("line", 0, 0, 1024, 768)
		
		love.graphics.print("OPTIONS", 245, 80)
		
		font = love.graphics.newFont("assets/fonts/BrookeS8.ttf" , 80)
		love.graphics.setFont(font)
		
		if not chVol then
			love.graphics.print("VOLUME", 410, 352)
			love.graphics.print("CREDITS", 420, 432)
		else
			love.graphics.print("+  -", 450, 352)
			love.graphics.print("CONFIRM", 420, 432)
		end
		love.graphics.print("BACK", 450, 512)
	end
	
	
	
	function love.mousepressed( x, y)   
		-- START GAME
		if x > 336 and x < 694 and y > 352 and y < 419 then 
			if (not pause) then
				loadStage(1)
			end	
		end
		-- OPTIONS
		if x > 403 and x < 623 and y > 432 and y < 519 then 
			show_option = true
		end
		-- QUIT
		if x > 450 and x < 586 and y > 512 and y < 579 then 
			love.event.quit()
		end
	end
end