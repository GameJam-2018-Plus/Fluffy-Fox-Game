Hitbox = {}

function Hitbox:new(x,y,w,h)
    obj = {}
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
