local Class = require('libs.hump.class')
local Entity = require('entities.Entity')

local Player = Class{
    __includes = Entity
}

function Player:init(world, x, y)
    self.img = love.graphics.newImage('/assets/character_block.png')

    Entity.init(self, world, x, y, self.img:getWidth(), self.img:getHeight())

    --* Unique Player Values
    self.xVelocity  = 0
    self.yVelocity  = 0
    self.acc        = 100 --* acceleration
    self.maxSpeed   = 600
    self.friction   = 20
    self.gravity    = 80

    self.isJumping      = false
    self.isGrounded     = false
    self.hasReachedMax  = false
    self.jumpAcc        = 500
    self.jumpMaxSpeed   = 11

    self.world:add(self, self:getRect())
end

function Player:collisonFilter(other)
    local x, y, w, h = self.world:getRect(other)
    local playerBottom = self.y + self.h
    local otherBottom = y + h

    if playerBottom <= y then
        return 'slide'
    end
end

function Player:update(dt)
    local prevX, prevY = self.x, self.y

    --* Apply friction
    self.xVelocity = self.xVelocity * (1 - math.min(dt * self.friction, 1))
    self.yVelocity = self.yVelocity * (1 - math.min(dt * self.friction, 1))

    --* Apply gravity
    self.yVelocity = self.yVelocity + self.gravity * dt

    --* Movement Controls
    if love.keyboard.isDown('left', 'a') and self.xVelocity > -self.maxSpeed
    then
        self.xVelocity = self.xVelocity - self.acc * dt
    elseif love.keyboard.isDown('right', 'd') and self.xVelocity < self.maxSpeed
    then
        self.xVelocity = self.xVelocity + self.xVelocity * dt
    end

    if love.keyboard.isDown('up', 'w') then
        if -self.yVelocity < self.jumpMaxSpeed and not self.hasReachedMax
        then
            self.yVelocity = self.yVelocity - self.jumpAcc * dt
        elseif math.abs(self.yVelocity) > self.jumpMaxSpeed then
            self.hasReachedMax = true
        end
        self.isGrounded = false
    end

    local goalX = self.x + self.xVelocity
    local goalY = self.y + self.yVelocity

    --* Move the player while testing for Collisions
    --todo what does this mean?
    self.x, self.y, Collisions, Len = self.world:move(self, goalX, goalY, self.collisionFilter)

    --* Collision Checks
    for i, collision in ipairs(Collisions) do
        if collision.touch.y > goalY then
            self.hasReachedMax = true
            self.isGrounded = false
        elseif collision.normal.y < 0 then
            self.hasReachedMax = false
            self.isGrounded = true
        end
    end

end

function Player:draw()
    love.graphics.draw(self.img, self.x, self.y)
end

return Player