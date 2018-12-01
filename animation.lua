-- Global table
Animation = {}

-- Constructor reading image path and generating render quads
function Animation:new(image, width, height, duration)
    local animation = {}
    -- Sprite sheet with all frames on one image
    animation.spriteSheet = love.graphics.newImage(image);
    -- Boundaries of single images
    animation.quads = {};

    for y = 0, animation.spriteSheet:getHeight() - height, height do
        for x = 0, animation.spriteSheet:getWidth() - width, width do
            table.insert(animation.quads, 
            love.graphics.newQuad(x, y, width, height, animation.spriteSheet:getDimensions()))
        end
    end

    animation.duration = duration or 1
    animation.currentTime = 0

    self.__index = self
    return setmetatable(animation, self)
end

-- Set the timestamps via the delta time, for correct render quad selection
function Animation:update(dt)
   self.currentTime = self.currentTime + dt
   if self.currentTime >= self.duration then
        self.currentTime = self.currentTime - self.duration
    end
end

-- Draw current quad of the sprite sheet
function Animation:draw()
    local spriteNum = math.floor(self.currentTime / self.duration * #self.quads) + 1
    	love.graphics.draw(self.spriteSheet, self.quads[spriteNum])
end
