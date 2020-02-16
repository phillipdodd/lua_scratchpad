Bump = require 'libs.bump.bump'

World = nil
Ground_0 = {}
Ground_1 = {}

Player = {
    x = 16,
    y = 16,

    xVelocity = 0,
    yVelocity = 0,
    acc = 100,
    maxSpeed = 600,
    friction = 20,
    gravity = 80,

    isJumping = false,
    isGrounded = false,
    hasReachedMax = false,
    jumpAcc = 500,
    jumpMaxSpeed = 9.5,

    img = nil,

    filter = function(item, other)
        local x, y, w, h = world:getRect(other)
        local px, py, pw, ph = world:getRect(item)
        local playerBottom = py + ph
        local otherBottom = y + h

        if playerBottom <= y then
            return 'slide'
        end
    end
}

function love.load()
    World = Bump.newWorld(16) --? 16px tile size
    Player.img = love.graphics.newImage('assets/character_block.png')

    World:add(
        Player, Player.x, Player.y,
        Player.img:getWidth(),
        Player.img:getHeight()
    )

    --* Draw a level
    World:add(Ground_0, 120, 360, 640, 16)
    World:add(Ground_1, 0, 448, 640, 32)

end

function love.update(dt)
    local goalX = Player.x + Player.xVelocity
    local goalY = Player.y + Player.yVelocity
    Player.x, Player.y, Collisions = World:move(Player, goalX, goalY)
    --* Apply Friction
    Player.xVelocity = Player.xVelocity * (1 - math.min(dt * Player.friction, 1))
    Player.yVelocity = Player.yVelocity * (1 - math.min(dt * Player.friction, 1))

    --* Apply Gravity
    Player.yVelocity = Player.yVelocity + Player.gravity * dt

    --! Controls

    if love.keyboard.isDown('left', 'a') and Player.xVelocity > -Player.maxSpeed then
        Player.xVelocity = Player.xVelocity - Player.acc * dt
    elseif love.keyboard.isDown('right', 'd') and Player.xVelocity < Player.maxSpeed then
        Player.xVelocity = Player.xVelocity + Player.acc * dt
    end

    if love.keyboard.isDown('up', 'w') then
        if -Player.yVelocity < Player.jumpMaxSpeed and not Player.hasReachedMax then
            Player.yVelocity = Player.yVelocity - Player.jumpAcc * dt
        elseif math.abs(Player.yVelocity) > Player.jumpMaxSpeed then
            Player.hasReachedMax = true
        end
        Player.isGrounded = false
    end

    for _, coll in ipairs(Collisions) do
        if coll.touch.y > goalY then
            Player.hasReachedMax = true
            Player.isGrounded = false
        elseif coll.normal.y < 0 then
            Player.hasReachedMax = false
            Player.isGrounded = true
        end
    end

end

function love.keypressed(key)
    if key == 'escape' then
        love.event.push('quit')
    end
end

function love.draw(dt)
    love.graphics.draw(Player.img, Player.x, Player.y)
    love.graphics.rectangle('fill', World:getRect(Ground_0))
    love.graphics.rectangle('fill', World:getRect(Ground_1))
end

