pause = {}

function pause.load()

end

function pause.update()

end

function pause.draw()
    love.graphics.print("PAUSE", 375, 0)
    love.graphics.print("Press 'Escape' to continue", 300, 180)
end

function pause.keypressed(key)
    if key == 'escape' then
        state = g
    end
end

return pause