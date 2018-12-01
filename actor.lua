require 'hitbox'

Actor = {}
def_w = 200
def_h = 200
def_duration = 1

-- x, y = pos,  anims = vector of Animation indexed by "idle" "walk" "slash"
-- vel ???, team = tag 1 for player, tag 2 for enemy
function Actor:new(x, y, anims_path, vel, max_health, team)
    local obj = {}
    obj.x = x
    obj.y = y
    obj.anims_path = anims_path
    obj.anims = {}
    obj.anims.idle = Animation:new( "/assets/"..anims_path .."/idle.png",def_w,def_h,def_duration)
    obj.anims.walk = Animation:new( "/assets/"..anims_path .."/walk.png",def_w,def_h,def_duration)
    obj.anims.slash = Animation:new("/assets/"..anims_path .."/slash.png",def_w,def_h,def_duration)
    obj.w, obj.h = def_w, def_h
    obj.anim_state = "idle"
    obj.facing = true
    obj.max_health = max_health or 20
    obj.health = max_health
    obj.hbox = Hitbox:new(obj.x, obj.y, obj.w, obj.h)
    obj.abox = Hitbox:new(obj.x + obj.w, obj.y, obj.w / 2, obj.h)
    obj.team = team or 2
    obj.logic_state = "default"
    self.__index = self

    return setmetatable(obj, self)
end

function Actor:draw(camera)
    if self.facing then
        self.anims[self.anim_state]:draw(self.x-camera.x,self.y-camera.y)
    else
        self.anims[self.anim_state]:draw(self.x-camera.x,self.y-camera.y,-1,self.w)
    end
end

function Actor:update(dt)
    if self.team == 1 then
        if love.keyboard.isDown("a") then self:move(-5) 
        elseif love.keyboard.isDown("d") then self:move(5)
        elseif love.keyboard.isDown("space") then self:hit()
        else self:idle() end
    end
    self.anims[self.anim_state]:update(dt)
end

function Actor:move(x)
    if self.anim_state ~= "walk" then
        self.anims[self.anim_state]:reset()
    end
    self.anim_state = "walk"
    self.x = self.x + x
    if x > 0 then
        self.facing = true
    else
        self.facing = false
    end
end

function Actor:idle()
    if self.anim_state ~= "idle" then
        self.anims[self.anim_state]:reset()
    end
    self.anim_state = "idle"
end

function Actor:get_hit()
  --  self.health = self.health - 1
end

function Actor:hit()
    if self.anim_state ~= "slash" then
        self.anims[self.anim_state]:reset()
    end
    self.anim_state = "slash"
    -- starts hitting movement
 --   hit_check() -- Checks, what actors got hit.
end

function Actor:ki()
    if self.team ~= 1 then
        -- KI-Skript
    end
end

function Actor:get_box(ident)
    if ident == "att" then
        if facing then
            return self.abox
        else
            return Hitbox:new(self.abox.x - 1.5 * self.w, self.abox.y, self.abox.w, self.abox.h)
        end
    elseif ident == "hurt" then
        return self.hbox
    end
end

