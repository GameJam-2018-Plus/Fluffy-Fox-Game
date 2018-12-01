require 'stage'

function love.load()
    ground = Stage:new(love.audio.newSource("test.ogg", "stream"), love.graphics.newImage("jack.jpg"), 60, nil)
    ground["music"].start()
end

player = Actor:new(100, 100, nil, team=1)

function newStage(a, g, h, s)
    ground["music"].stop()
    ground = Stage:new(a, g, h, s)
    ground["music"].start()
end

function hit_check()
    for _, s in pairs(AllActors) do
        if s.hau == true then
            for _, t in pairs(AllActors) do
                if s.team ~= t.team and t.visible then
                    -- hier den collide check machen: 
                    if s.hbox.collide(t.hbox) then
                        t.get_hit()
end end end end end end

function love.update()
    if not ground["music"]:isPlaying() then ground["music"]:stop() ground["music"]:start() end
    for  _, s in pairs(AllActors) do s:ki() end
end

function love.draw()
    love.graphics.draw(ground["bg"], 0, 0)
    for _, s in pairs(AllActors) do s:draw() end
    -- b1 = Hitbox:new(0,0,10,10)
    -- b2 = Hitbox:new(0,10,10,10)
    -- if(b1:collide(b2)) then love.graphics.print("Collide!",400,200) end
    -- love.graphics.print("Hello World", 400, 300)
end
