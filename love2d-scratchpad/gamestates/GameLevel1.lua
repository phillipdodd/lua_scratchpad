local bump = require 'libs.bump.bump'
local Entities = require 'entities.Entities'

local game = {}

function game:enter()
    Entities:enter()
end

function game:update(dt)
    Entities:update(dt)
end

function game:draw()
    print('game draw')
    Entities:draw()
end

return game