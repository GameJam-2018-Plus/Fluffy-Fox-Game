require 'hitbox'

Actor = {}
def_w = 16
def_h = 18
def_duration = 1

-- x, y = pos,  anims = vector of Animation indexed by "idle" "walk" "slash"
-- vel ???, team = tag 1 for player, tag 2 for enemy
function Actor:new(x, y, anims_path, vel, max_health, team)
    local obj = {}
    obj.x = x
    obj.y = y
    obj.anims_path = anims_path
    obj.anims = {}
    obj.anims.idle = Animation:new(anims_path .. "/idle.png",def_w,def_h,def_duration)
    obj.anims.walk = Animation:new(anims_path .. "/walk.png",def_w,def_h,def_duration)
    obj.anims.slash = Animation:new(anims_path .. "/slash.png",def_w,def_h,def_duration)
    obj.w = obj.anims.idle.quads[1].width
    obj.h = obj.anims.idle.quads[1].height
    obj.anim_state = "idle"
    obj.facing = true
    obj.max_health = max_health or 20
    obj.health = max_health
    obj.hbox = Hitbox:new(obj.x, obj.y, obj.w, obj.h)
    obj.team = team or 2
    obj.logic_state = "default"
    self.__index = self

    return setmetatable(obj, self)
end

function Actor:draw()
    self.anims[self.anim_state]:draw(self.x,self.y)
end

function Actor:update(dt)
    if self.team == 1 then
        if love.keyboard.isDown("a") then self:move(-5) 
        elseif love.keyboard.isDown("d") then self:move(5) end
    end
    self.anims[self.anim_state]:update(dt)
end

function Actor:move(x)
    if self.anim_state ~= "walk" then
        self.anims[self.anim_state]:reset()
    end
    self.anim_state = "walk"
    self.x = self.x + x
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
