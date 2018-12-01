require 'actor'
-- Global table for stuffing functions into it. Don't ever override Stage
Stage = {}

-- Constructor for the stage
function Stage:new(music, bg, walk_height, actors)
    obj = {}
    obj.music = love.audio.newSource(music, "stream")
    obj.bg = bg
    obj.walk_height = walk_height
    obj.actors = actors
    self.__index = self
    return setmetatable(obj, self)
end

function Stage:update(dt)
    if not self.music:isPlaying() then
        self.music:stop()
        self.music:play()
    end
    self.bg:update(dt)
    for _,a in pairs(self.actors) do
        a:update(dt)
    end
end

function Stage:draw()
    self.bg:draw()
    for _,a in pairs(self.actors) do
        a:draw()
    end
end
