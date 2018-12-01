require 'stage'
require 'hitbox'

function love.draw()
    b1 = Hitbox:new(0,0,10,10)
    b2 = Hitbox:new(0,10,10,10)
    if(b1:collide(b2)) then love.graphics.print("Collide!",400,200) end
    love.graphics.print("Hello World", 400, 300)
end
