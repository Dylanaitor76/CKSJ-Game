h = require 'home'
g = require 'game'
d = require 'dead'
p = require 'pause'
b = require 'blocks'
v = require 'victory'

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