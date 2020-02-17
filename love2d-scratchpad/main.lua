local GameLevel1 = require 'gamestates.GameLevel1'
Gamestate = require 'libs.hump.gamestate'

function love.load()
    Gamestate.registerEvents()
    Gamestate.switch(GameLevel1)
end

function love.keypressed(key)
    if key == "escape" then
        love.event.push('quit')
    end
end