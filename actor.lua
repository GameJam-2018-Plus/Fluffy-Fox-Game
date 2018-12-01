require 'hitbox'

Actor = {}

AllActors = {}

function Actor:new(x, y, img, visible=false, vel=5, max_health=20, team=2)
    obj = {}
    obj.w, obj.h = img:getPixelDimensions()
    obj.x = x
    obj.y = ground["walk_height"] - obj.h
    obj.visible = visible
    obj.img = img
    obj.vel = vel
    obj.state = "idel"
    obj.facing = true
    obj.max_health = max_health
    obj.health = max_health
    obj.hbox = Hitbox:new(obj.x, obj.y, obj.w, obj.h)
    obj.team = team
    obj.hau = false -- if there's currently a strik going on
    self.__index = self

    AllActors.newKey() = {self}
    return setmetatable(obj, self)
end

function Actor:draw()
end

function Actor:get_hit()
    self.health = self.health - 1
end

function Actor:hit()
    -- starts hitting movement
    hit_check() -- Checks, what actors got hit.
end

function Actor:ki()
    if self.team ~= 1 then
        -- KI-Skript
    end
end