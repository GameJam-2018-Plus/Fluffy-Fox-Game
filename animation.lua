-- Global table
Animation = {}

-- Constructor reading image path and generating render quads
function Animation:new(image, width, height, fps)
    local animation = {}
    animation.w = width
    animation.h = height
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

    animation.fps = fps or 24
    animation.currentTime = 0

    self.__index = self
    return setmetatable(animation, self)
end

-- Set the timestamps via the delta time, for correct render quad selection
function Animation:update(dt)
   self.currentTime = self.currentTime + dt
   if self.currentTime >= #self.quads / self.fps then
        self.currentTime = self.currentTime - #self.quads / self.fps
        return 1
    end
    return 0
end

function Animation:reset()
    self.currentTime = 0
end

-- Draw current quad of the sprite sheet
function Animation:draw(x,y,x_scale,x_offset)
    local spriteNum = math.floor(self.fps * self.currentTime) + 1
    	love.graphics.draw(self.spriteSheet, self.quads[spriteNum],x,y,0,x_scale,1,x_offset,0)
end
