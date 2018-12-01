Camera = {}

function Camera:new(x,y,w,h)
    local camera = {}
    camera.x = x
    camera.y = y
    camera.w = w
    camera.h = h
    self.__index = self
    return setmetatable(camera, self)
end
