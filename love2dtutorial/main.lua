debug = false
Player = {
    x = 200,
    y = 710,
    speed = 300,
    img = nil,
    isAlive = true,
    score = 0
}

BulletImg = {}
EnemyImg = {}

--! Timers

----* Shooting

CanShoot = true
CanShootTimerMax = 0.2
CanShootTimer = CanShootTimerMax

----* Enemies

CreateEnemyTimerMax = 0.4
CreateEnemyTimer = CreateEnemyTimerMax



--! Entity Storage

Bullets = {}
Enemies = {}

function love.load(arg)
    Player.img = love.graphics.newImage('gfx/character.png')
    BulletImg[1] = love.graphics.newImage('gfx/bullet_2_blue.png')
    BulletImg[2] = love.graphics.newImage('gfx/bullet_2_orange.png')
    BulletImg[3] = love.graphics.newImage('gfx/bullet_2_purple.png')
    EnemyImg[1] = love.graphics.newImage('gfx/enemy_1.png')
    EnemyImg[2] = love.graphics.newImage('gfx/enemy_2.png')
    EnemyImg[3] = love.graphics.newImage('gfx/enemy_3.png')
end

function love.update(dt)    
    --* Timers

    CanShootTimer = CanShootTimer - (1 * dt)
    if CanShootTimer < 0 then CanShoot = true end

    CreateEnemyTimer = CreateEnemyTimer - (1 * dt)
    if CreateEnemyTimer < 0 then
        CreateEnemyTimer = CreateEnemyTimerMax
        table.insert(Enemies, CreateEnemy())
    end

    --! Controls

    ----* Exit

    if love.keyboard.isDown('escape') then
        love.event.push('quit')
    end

    ----* Restart

    if love.keyboard.isDown('r') and not Player.isAlive then
        -- todo this wouldn't allow previous entities to GC
        Bullets = {}
        Enemies = {}

        CanShootTimer = CanShootTimerMax
        CreateEnemyTimer = CreateEnemyTimerMax

        Player.x = 50
        Player.y = 710

        Player.score = 0
        Player.isAlive = true
    end

    ----* Player Shooting
    if love.keyboard.isDown('space') and CanShoot then
        table.insert(Bullets, CreateBullet())
        CanShoot = false
        CanShootTimer = CanShootTimerMax
    end

    ----* Player movement x axis
    if love.keyboard.isDown('left', 'a') then
        if Player.x > 0 then
            Player.x = Player.x - (Player.speed * dt)
        end
    elseif love.keyboard.isDown('right', 'd') then
        if Player.x < (love.graphics.getWidth() - Player.img:getWidth()) then
            Player.x = Player.x + (Player.speed * dt)
        end
    end
    
    ----* Player movement y axis
    if love.keyboard.isDown('up', 'w') then
        if Player.y > 0 then
            Player.y = Player.y - (Player.speed * dt)
        end
    elseif love.keyboard.isDown('down', 's') then
        if Player.y < (love.graphics.getHeight() - Player.img:getHeight()) then
            Player.y = Player.y + (Player.speed * dt)
        end
    end

    --! Updates

    ----* Bullets

    for i, bullet in ipairs(Bullets) do
        bullet.y = bullet.y - (250 * dt)
        if bullet.y < 0 then
            table.remove(Bullets, i)
        end
    end

    ---- * Enemies
    for i, enemy in ipairs(Enemies) do
        enemy.y = enemy.y + (enemy.speed * dt)
        if enemy.y > (love.graphics.getHeight() + enemy.img:getHeight()) then
            table.remove(Enemies, i)
        end
    end

    --! Collision Detection

    for i, enemy in ipairs(Enemies) do
        for j, bullet in ipairs(Bullets) do
            --* Enemy / Bullet
            if CheckCollision(
                enemy.x, enemy.y,
                enemy.img:getWidth(),
                enemy.img:getHeight(),
                bullet.x, bullet.y,
                bullet.img:getWidth(),
                bullet.img:getHeight()
             ) then
                table.remove(Bullets, j)
                table.remove(Enemies, i)
                Player.score = Player.score + 1
             end
        end
        --* Enemy / Player
        if CheckCollision(
            enemy.x, enemy.y,
            enemy.img:getWidth(),
            enemy.img:getHeight(),
            Player.x, Player.y,
            Player.img:getWidth(),
            Player.img:getHeight()
        ) and Player.isAlive then
            table.remove(Enemies, i)
            Player.isAlive = false
        end
    end

end

function love.draw(dt)

    --* Score
    love.graphics.print(
        "Score: " .. Player.score, 
        love.graphics:getWidth() - 100, 
        love.graphics:getHeight() - 50)

    --* Player
    if Player.isAlive then
        love.graphics.draw(Player.img, Player.x, Player.y)
    else
        love.graphics.print(
            "Press 'R' to restart", 
            (love.graphics:getWidth() / 2) - 50,
            (love.graphics:getHeight() / 2) - 10
        )
    end

    --* Bullets
    for _, bullet in ipairs(Bullets) do
        love.graphics.draw(bullet.img, bullet.x, bullet.y)
    end

    --* Enemies
    for _, enemy in ipairs(Enemies) do
        love.graphics.draw(enemy.img, enemy.x, enemy.y)
    end
end

-- Collision detection taken function from http://love2d.org/wiki/BoundingBox.lua
-- Returns true if two boxes overlap, false if they don't
-- x1,y1 are the left-top coords of the first box, while w1,h1 are its width and height
-- x2,y2,w2 & h2 are the same, but for the second box
function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

function CreateEnemy()
    local upperSpeed = 250 + (Player.score / 2)
    local lowerSpeed = 150 + (Player.score / 2)
    return {
        x = math.random(10, love.graphics.getWidth() - 10),
        y = -10,
        img = EnemyImg[math.random(1, 3)],
        speed = math.random(150, 250)
    }
end

function CreateBullet()
    return {
        x = Player.x + (Player.img:getWidth() / 2),
        y = Player.y,
        img = BulletImg[math.random(1,3)]
    }
end