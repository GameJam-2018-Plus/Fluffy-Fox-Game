Hitbox = {}

function Hitbox:new(x,y,w,h)
    local obj = {}
    obj.x = x
    obj.y = y
    obj.w = w
    obj.h = h
    self.__index = self
    return setmetatable(obj, self)
end

function Hitbox:collide(box)
    return  self.x < box.x+box.w and
            box.x < self.x+self.w and
            self.y < box.y+box.h and
            box.y < self.y+self.h
end

function Hitbox:draw(camera)
    love.graphics.rectangle("line", self.x - camera.x, self.y - camera.y, self.w,self.h)
end
