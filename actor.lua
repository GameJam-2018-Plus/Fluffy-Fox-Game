require 'hitbox'

Actor = {}
def_w = 200
def_h = 200
-- actually fps
def_duration = 24

-- x, y = pos,  anims = vector of Animation indexed by "idle" "walk" "slash"
-- vel ???, team = tag 1 for player, tag 2 for enemy
function Actor:new(x, y, anims_path, vel, max_health, team, hbox, abox, sounds)
    local obj = {}
    obj.x = x
    obj.y = y
    obj.anims_path = anims_path
    obj.anims = {}
    obj.anims.idle = Animation:new( "/assets/"..anims_path .."/idle.png",def_w,def_h,def_duration)
    obj.anims.walk = Animation:new( "/assets/"..anims_path .."/walk.png",def_w,def_h,def_duration*2)
    obj.anims.slash = Animation:new("/assets/"..anims_path .."/slash.png",def_w,def_h,def_duration*3)
    obj.anims.slash = Animation:new("/assets/"..anims_path .."/death.png",def_w,def_h,def_duration)
    obj.w, obj.h = def_w, def_h
    obj.anim_state = "idle"
    obj.facing = true
    obj.max_health = max_health or 20
    obj.health = max_health
    obj.hbox = hbox
    obj.abox = abox
    obj.team = team or 2
    obj.alive = true
    obj.sounds = sounds
    obj.vel = vel
    obj.xv = -5
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
    if not self.alive then
        self:die()
        return
    end
    wrap = self.anims[self.anim_state]:update(dt)
    if self.team == 1 then
        if love.keyboard.isDown("a") then self:move(-5) 
        elseif love.keyboard.isDown("d") then self:move(5)
        elseif love.keyboard.isDown("space") then self:hit()
        elseif self.anim_state ~= "slash" or wrap == 1 then self:idle()
        elseif self.anims.slash.currentFrame == 25 then 
            if stage:hit(self:get_box("att")) then self.sounds.hit:play() end
        end
    end
    local xx = self.x - stage:get_player().x
    if self.team == 2 then
        if math.abs(xx) < 350 then
            xy = xx/math.abs(xx)
            self.x = self.x - xy*3
            if xy < 0 then self.facing = true else self.facing = false end
        end
    end
    if self.team == 3 then
        if self.y + self.vel < 400 then
            self.y = self.y + self.vel
            self.vel = self.vel + 1
        else
            self.vel = - self.vel
            self.y = self.y + self.vel
            self.vel = self.vel + 1
        end
        if self.y < 99 then
            self.vel = 0
            self.y = 100
        end
        if self.xv<0 then self.facing = false else self.facing = true end 
        self.x = self.x + self.xv
        if self.x < 5 then self.xv = 5 end
        if self.x > 4096 - self.w then self.xv = -5 end
        self:hit()
    end
    if self.team == 4 then
        if xx < 0 then self.facing = true else self.facing = false end
        if math.abs(xx) < 450 then
            self:hit(xx)
        end
    end
    if self.team == 5 then
        self.x = self.x + self.xv
        self.y = self.y + self.vel
        self:hit()
    end
end

function Actor:move(x)
    if self.anim_state ~= "walk" then
        self.anims[self.anim_state]:reset()
    end
    self.anim_state = "walk"
    self.x = self.x + x
    self.sounds.steps:play()
    if x > 0 then
        self.facing = true
    else
        self.facing = false
    end
end

function Actor:idle()
    if self.anim_state ~= "idle" then
        self.anims[self.anim_state]:reset()
        self.sounds.steps:stop()
    end
    self.anim_state = "idle"
end

function Actor:die()
    if self.anim_state ~= "idle" then
        self.anims[self.anim_state]:reset()
        self.sounds.steps:stop()
    end
    if self.anims.death.currentFrame == self.anims.death.numFrames then

    else
        self.anims[self.anim_state]:update(dt)
    end
end

function Actor:get_hit()
    print("Hit detected")
    self.health = self.health - 1
    if(self.health == 0) then print("Actor died") 
        alive = false 
        self.sounds.ouch:play() 
    end
end

function Actor:hit(xx)
    if xx and self.x<-500 then
        local r = math.sqrt(40000 + xx*xx)
        g_brick.xv = xx/r
        g_brick.vel = 200/r
        g_brick.x = self.x + self.w/2 + g_brick.xv
        g_brick.y = self.y + self.h/2 + g_brick.vel
        g_brick.health = 1
    end
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

