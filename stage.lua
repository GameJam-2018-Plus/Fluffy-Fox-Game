require 'actor'
-- Global table for stuffing functions into it. Don't ever override Stage
Stage = {}

-- Constructor for the stage
function Stage:new(p_music, p_bg, p_walk_height, p_actors)
    obj = {music = p_music, bg = p_bg, 
            walk_height = p_walk_height, actors = p_actors}
    self.__index = self
    return setmetatable(obj, self)
end
