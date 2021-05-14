game = {}

b = require 'blocks'

function game.load()

end

function game.update()

end

function game.draw()
    love.graphics.setColor(0, 0, 0)
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("GAME", 375, 0)
    love.graphics.print("Press 'Escape' to continue", 300, 180)

end

function game.keypressed(key)
    if key == 'escape' then
        state = p
    end
end

return game