require 'actor'
require 'stage_0'
require 'stage_1'
require 'stage_2'
require 'stage_3'
-- Global table for stuffing functions into it. Don't ever override Stage
Stage = {}

-- Constructor for the stage
function Stage:new(music, bg, walk_height, actors)
    local obj = {}
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
    self:check_collision()
    return -1
end

function Stage:draw()
    self.bg:draw()
    for _,a in pairs(self.actors) do
        a:draw()
    end
end

function Stage:quit()
    self.music:stop()
end

function loadStage(index)
    current_stage = index
    if next(stage) ~= nil then stage:quit() end
    if index == 0 then
	stage = stage_0()
    end
    if index == 1 then
        stage = stage_1()
    end
    if index == 2 then
	stage = stage_2()
    end
    if index == 3 then
	stage = stage_3()
    end
end

function Stage:check_collision()
    for _, a in pairs(self.actors) do
        if a.logic_state == "slash" then
            for _, b in pairs(self.actors) do
                if a:get_box("att"):collide(b:get_box("hurt")) then
                    b:get_hit()
                end
            end
        end
    end
end

function Stage:get_player()
    for _, a in pairs(self.actors) do
        if a.team == 1 then
            return a
        end
    end
end
