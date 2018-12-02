require 'actor'
require 'stage_0'
require 'stage_1'
require 'stage_2'
require 'stage_3'
require 'camera'
-- Global table for stuffing functions into it. Don't ever override Stage
Stage = {}

-- Constructor for the stage
function Stage:new(music, bg, walk_height, actors)
    local obj = {}
    obj.music = love.audio.newSource(music, "stream")
    obj.bg = bg
    obj.walk_height = walk_height
    obj.actors = actors
    obj.camera = Camera:new(0,0,love.graphics.getDimensions())
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
        a:update(dt,stage)
    end
    return -1
end

function Stage:draw()
    self:move_camera()
    self.bg:draw(-self.camera.x, -self.camera.y)
    for _,a in pairs(self.actors) do
        a:draw(self.camera)
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

function Stage:hit(box)
    for _, b in pairs(self.actors) do
        if box:collide(b:get_box("hurt")) then
            b:get_hit()
            return true
        end
    end
    return false
end

function Stage:get_player()
    for _, a in pairs(self.actors) do
        if a.team == 1 then
            return a
        end
    end
    print("no player, wtf?")
end

function Stage:move_camera()
    local player = self:get_player()
    local x_p_center = player.x + player.w / 2
    local y_p_center = player.y + player.h / 2
    local x_cam = x_p_center - self.camera.w / 2
    local y_cam = y_p_center - self.camera.h / 2
    if x_cam + self.camera.w > self.bg.w then x_cam = self.bg.w - self.camera.w end
    if x_cam < 0 then x_cam = 0 end
    if y_cam + self.camera.h > self.bg.h then y_cam = self.bg.h - self.camera.h end
    if y_cam < 0 then y_cam = 0 end
    self.camera.x = x_cam
    self.camera.y = y_cam
end
