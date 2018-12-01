require 'hitbox'

Actor = {}
def_w = 200
def_h = 200
-- actually fps
def_duration = 24

-- x, y = pos,  anims = vector of Animation indexed by "idle" "walk" "slash"
-- vel ???, team = tag 1 for player, tag 2 for enemy
function Actor:new(x, y, anims_path, vel, max_health, team, hbox, abox)
    local obj = {}
    obj.x = x
    obj.y = y
    obj.anims_path = anims_path
    obj.anims = {}
    obj.anims.idle = Animation:new( "/assets/"..anims_path .."/idle.png",def_w,def_h,def_duration)
    obj.anims.walk = Animation:new( "/assets/"..anims_path .."/walk.png",def_w,def_h,def_duration)
    obj.anims.slash = Animation:new("/assets/"..anims_path .."/slash.png",def_w,def_h,def_duration*3)
    obj.w, obj.h = def_w, def_h
    obj.anim_state = "idle"
    obj.facing = true
    obj.max_health = max_health or 20
    obj.health = max_health
    obj.hbox = hbox
    obj.abox = abox
    obj.team = team or 2
    self.__index = self

    return setmetatable(obj, self)
end

function Actor:draw(camera)
    -- Flip the character with offset width when facing left
    if self.facing then
        self.anims[self.anim_state]:draw(self.x-camera.x,self.y-camera.y)
    else
        self.anims[self.anim_state]:draw(self.x-camera.x,self.y-camera.y,-1,self.w)
    end
    self:get_box("hurt"):draw(camera)
    self:get_box("att"):draw(camera)
end

function Actor:update(dt, stage)
    wrap = self.anims[self.anim_state]:update(dt)
    if self.team == 1 then
        if love.keyboard.isDown("a") then self:move(-5) 
        elseif love.keyboard.isDown("d") then self:move(5)
        elseif love.keyboard.isDown("space") then self:hit()
        elseif self.anim_state ~= "slash" or wrap == 1 then self:idle()
        elseif self.anims.slash.current_frame == 25 then stage:hit(self:get_box("att")) end
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
end

function Actor:ki()
    if self.team ~= 1 then
        -- KI-Skript
    end
end

function Actor:get_box(ident)
    if ident == "att" then
        if self.facing then
            return Hitbox:new(self.abox.x + self.x, self.abox.y + self.y, self.abox.w, self.abox.h)
        else
            return Hitbox:new(self.w - self.abox.x - self.abox.w + self.x, self.abox.y + self.y, self.abox.w, self.abox.h)
        end
    elseif ident == "hurt" then
        return Hitbox:new(self.hbox.x + self.x, self.hbox.y + self.y, self.hbox.w, self.hbox.h)
    end
end

