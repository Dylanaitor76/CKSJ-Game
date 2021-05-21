home = {}

function home.load()
    player = love.graphics.newImage('playersprite.png')
end

function home.update()

end

function home.draw()
    love.graphics.print("HOME", 375, 0)
    love.graphics.draw(player, 350, 250)
    love.graphics.print("Press 'Escape' to continue", 300, 180)
end

function home.keypressed(key)
    if key == 'escape' then
        state = g
        state.load()
    end
end

return home