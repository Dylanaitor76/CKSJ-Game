dead = {}



function dead.load()
health = 4
require('game')
health_max = 4
require('game')
end

function dead.update()

end

function dead.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("DEAD", 375, 0)
    love.graphics.print("You have died! Press Escape to continue...", 300, 180)
end

function dead.keypressed(key)
    if key == 'escape' then
        health = health_max
        state = g
        state.load()
    end
end
return dead