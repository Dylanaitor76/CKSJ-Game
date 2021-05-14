h = require 'home'
g = require 'game'
p = require 'pause'
b = require 'blocks'

state = h

function love.load()
    state.load()
end

function love.update()
    state.update()
end

function love.draw()
    state.draw()
end

function love.keypressed(key)
    state.keypressed(key)

end