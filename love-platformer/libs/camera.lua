--* From http://osmstudios.com/tutorials/love2d-platformer-tutorial-part-3-creating-and-loading-levels
--* But says its from this tutorial: https://ebens.me/post/cameras-in-love2d-part-1-the-basics/

Camera = {}
Camera.x = 0
Camera.y = 0

function Camera:set()
    love.graphics.push()
    love.graphics.translate(-self.x, -self.y)
end

function Camera:unset()
    love.graphics.pop()
end

function Camera:move(dx, dy)
    self.x = self.x + (dx or 0)
    self.y = self.y + (dy or 0)
end

function Camera:setPosition(x, y)
    self.x = x or self.x
    self.y = y or self.y
end

return Camera