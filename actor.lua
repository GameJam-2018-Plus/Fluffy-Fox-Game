require 'hitbox'

Actor = {}

AllActors = {}

function Actor:new(x, y, img, visible, vel, max_health, team)
    obj = {}
    --obj.w, obj.h = img:getPixelDimensions()
    obj.x = x
    -- obj.y = ground["walk_height"] - obj.h
    obj.y = y
    obj.visible = visible or false
    obj.img = img
    obj.vel = vel or 5
    obj.state = "idel"
    obj.facing = true
    obj.max_health = max_health or 20
    obj.health = max_health
    obj.hbox = Hitbox:new(obj.x, obj.y, obj.w, obj.h)
    obj.team = team or 2
    obj.hau = false -- if there's currently a strik going on
    self.__index = self

    table.insert(AllActors,obj)
    return setmetatable(obj, self)
end

function Actor:draw()
end

function Actor:update()
end

function Actor:get_hit()
  --  self.health = self.health - 1
end

function Actor:hit()
    -- starts hitting movement
 --   hit_check() -- Checks, what actors got hit.
end

function Actor:ki()
    if self.team ~= 1 then
        -- KI-Skript
    end
end
