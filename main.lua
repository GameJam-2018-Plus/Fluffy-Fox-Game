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
		chVol = false
		show_option = false
		show_credits = false
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
	if not show_credits then
		--bga draw
		stage:draw()
		--gui sketch
		if current_stage == 0 or PAUSE then
			menu(PAUSE)
		end
		if current_stage ~= 0 and not PAUSE then
			function love.mousepressed( x, y) 
			end
		elseif show_option then
			if chVol then
				love.graphics.rectangle("line", 442, 368, 50, 50)
				love.graphics.rectangle("line", 540, 368, 50, 50)
			end
			function love.mousepressed( x, y) 
				-- Volumen
				if x > 336 and x < 694 and y > 352 and y < 419 then 
					if not chVol then
						chVol = true
					end
				end
				local volume = love.audio.getVolume( )
				if x > 442 and x < 492 and y > 368 and y < 418 then
					if volume < 1 then
						volume = volume + .05
						love.audio.setVolume(volume)
						print("Volume: "..volume)
					else
						volume = 1.0
						love.audio.setVolume(volume)
						print("Volume: "..volume)
					end
				end
				if x > 540 and x < 590 and y > 368 and y < 418 then
					if volume > 0 then
						volume = volume - .05
						love.audio.setVolume(volume)
					else
						volume = 0.0
						love.audio.setVolume(volume)
					end
				end
				-- CREDITS/CONFIRM
				if x > 403 and x < 623 and y > 432 and y < 519 then 
					if chVol then
						chVol = false
					else
						show_credits = true
                        credit_music = love.audio.newSource("assets/audio/Credits.ogg", "stream")
                        stage.music:stop()
                        credit_music:play()
					end
				end
				-- Back
				if x > 450 and x < 586 and y > 512 and y < 579 then 
					show_option = false
					chVol = false
				end
			end
		end
	else
		if love.keyboard.isDown("escape")then
			chVol = false
			show_option = true
			show_credits = false
            credit_music:stop()
            stage.music:play()
			love.timer.sleep(.42)
		else
			local dark = love.graphics.newImage("assets/bg/pauseScreen.png")
			love.graphics.draw(dark)
			
			font = love.graphics.newFont("assets/fonts/BrookeS8.ttf" , 180)
			love.graphics.setFont(font)
			love.graphics.rectangle("line", 0, 0, 1024, 768)
			love.graphics.print("CREDITS", 245, 40)

			font = love.graphics.newFont("assets/fonts/BrookeS8.ttf" , 80)
			love.graphics.setFont(font)
			love.graphics.print("GRAPHIC", 100, 180+25)
			love.graphics.print("SOFTWARE", 100, 330+25)
			love.graphics.print("STORY/DESIGN", 100, 480+25)
			love.graphics.print("MUSIC", 100, 630+25)
			
			font = love.graphics.newFont("assets/fonts/BrookeS8.ttf" , 40)
			love.graphics.setFont(font)
			love.graphics.print("Kirill", 600, 670)
			love.graphics.print("Felix", 600, 300-90)
			love.graphics.print("Michael", 600, 340-90)
			love.graphics.print("Leonhard", 600, 450-120)
			love.graphics.print("Leif", 600, 490-120)
			love.graphics.print("Daniel", 600, 530-120)
			love.graphics.print("Lisa", 600, 600-105)
			love.graphics.print("Vanessa", 600, 640-105)
			love.graphics.print("Frederic", 600, 680-105)
		end
	end
end	

