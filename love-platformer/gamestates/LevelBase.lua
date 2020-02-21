local bump =  require 'libs.bump.bump'
local Gamestate = require 'libs.hump.gamestate'
local Class = require 'libs.hump.class'
local sti = require 'libs.sti.sti'
local Entities = require 'entities.Entities'
local camera = require 'libs.camera'

local worldSize = 32

local LevelBase = Class{
    __includes = Gamestate,
    init = function(self, mapFile)
        self.map = sti(mapFile, {'bump'})
        self.world = bump.newWorld(worldSize)
        self.map:resize(love.graphics.getWidth(), love.graphics.getHeight())
        self.map:bump_init(self.world)
        Entities:enter()
    end,
    Entities = Entities,
    camera = camera
}

function LevelBase:keypressed(key)
    if Gamestate.current() == pause and key == 'p' then 
        Gamestate.push(pause)
    end
end

function LevelBase:positionCamera(player, camera)
    --? Get width in pixels
    local mapWidth = self.map.width * self.map.tileWidth
    local halfScreen = love.graphics.getWidth() / 2

    local boundX = nil

    --? Use this value until we are approaching the end of the viewport
    if player.x < (mapWidth - halfScreen) then
        --? Lock on left side of screen
        boundX = math.max(0, player.x - halfScreen)
    else
        --? Lock on right side of screen
        boundX = math.min(player.x - halfScreen, mapWidth - love.graphics.getWidth())
    end

    camera:setPosition(boundX, 0)
end

return LevelBase