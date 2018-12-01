Actor = {}

function Actor:new()
    obj = {}
    self.__index = self
    return setmetatable(obj, self)
end
