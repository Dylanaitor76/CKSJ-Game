victory = {}

function victory.load()
    player = love.graphics.newImage('playersprite.png')
end

function victory.update()

end

function victory.draw()
    love.graphics.print("VICTORY", 375, 0)
    love.graphics.draw(player, 350, 250)
    love.graphics.print(" YOU WIN!!! Press 'Escape' to go back to the home screen", 250, 180)
end

function victory.keypressed(key)
    if key == 'escape' then
        state = h
        state.load()
    end
end

return victory