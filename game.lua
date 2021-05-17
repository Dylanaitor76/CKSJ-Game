game = {}

b = require 'blocks'

function game.load()
    play = love.graphics.newImage('playersprite.png')
end

function game.update()

end

function game.draw()
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle('fill', 0, 384, 816, 216)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(play, 0, 0)
    love.graphics.print("GAME", 375, 0)
    love.graphics.print("Press 'Escape' to continue", 300, 180)
    love.graphics.setColor(0, 0, 10)

end

function game.keypressed(key)
    if key == 'escape' then
        state = p
        state.load()
    end

    if key == 'space' then
        state = h
        state.load()
    end
end

return game