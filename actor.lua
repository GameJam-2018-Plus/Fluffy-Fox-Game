require 'hitbox'

Actor = {}
def_w = 200
def_h = 200
-- actually fps
def_duration = 24

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
    obj.hbox = Hitbox:new(0,0, obj.w, obj.h)
    obj.abox = Hitbox:new(obj.w/2, 0, obj.w / 2, obj.h)
    obj.team = team or 2
    obj.logic_state = "default"
    obj.slash_counter = -1
    self.__index = self

    return setmetatable(obj, self)
end

function Actor:draw(camera)
    if self.facing then
        self.anims[self.anim_state]:draw(self.x-camera.x,self.y-camera.y)
    else
        self.anims[self.anim_state]:draw(self.x-camera.x,self.y-camera.y,-1,self.w)
    end
    self:get_box("hurt"):draw()
    self:get_box("att"):draw()
end

function Actor:update(dt)
    wrap = self.anims[self.anim_state]:update(dt)
    if self.team == 1 then
        if love.keyboard.isDown("a") then self:move(-5) 
        elseif love.keyboard.isDown("d") then self:move(5)
        elseif love.keyboard.isDown("space") then self:hit()
        elseif self.anim_state ~= "slash" or wrap == 1 then self:idle() end
    end
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
    print("Hit detected")
  --  self.health = self.health - 1
end

function Actor:hit()
    if self.anim_state ~= "slash" then
        self.anims[self.anim_state]:reset()
    end
    self.anim_state = "slash"
    -- starts hitting movement
    -- hit_check() -- Checks, what actors got hit.
    if self.slash_counter < 0 then self.slash_counter = 0 end
end

function Actor:count_slash()
    if self.slash_counter >= 0 then self.slash_counter = self.slash_counter + 1 end
    if self.slash_counter > 24 and self.slash_counter < 29 then self.logic_state = "slash" end
    if self.slash_counter >= 29 then self.logic_state = "default" end
    if self.slash_counter >= 40 then self.slash_counter = -1 end
end

function Actor:ki()
    if self.team ~= 1 then
        -- KI-Skript
    end
end

function Actor:get_box(ident)
    if ident == "att" then
        if facing then
            return Hitbox:new(self.abox.x + self.x, self.abox.y + self.y, self.abox.w, self.abox.h)
        else
            return Hitbox:new(self.abox.x + self.x - 1 * self.w, self.abox.y + self.y, self.abox.w, self.abox.h)
        end
    elseif ident == "hurt" then
        return Hitbox:new(self.hbox.x + self.x, self.hbox.y + self.y, self.hbox.w, self.hbox.h)
    end
end

