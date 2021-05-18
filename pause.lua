pause = {}

function pause.load()
pselx = 10
psely = 13
blank = love.graphics.newImage('blank.png')
select = love.graphics.newImage('select.png')
end

function pause.update()

end

function pause.draw()
    love.graphics.setColor(1, 1, 1)
    love.graphics.print("PAUSE", 375, 0)
    love.graphics.draw(blank, 0, 0)
    love.graphics.print("RETURN TO GAME (WIP)",55 ,20)
    love.graphics.draw(blank, 0, 50)
    love.graphics.print("RESET",55 ,70)
    love.graphics.draw(blank, 0, 100)
    love.graphics.print("RETURN TO MAIN MENU",55 ,120)
    love.graphics.draw(select, pselx, psely)
end

function pause.keypressed(key)
    if key == 'escape' then
        state = g
    end

    if key == 'w' then
        if psely > 13 then
            psely = psely - 50
        end
    end
    if key == 's' then
        if psely < 100 then
            psely = psely + 50
        end
    end

    if psely == 13 then
        if key == 'return' then
            state = g --change state to game (still resets game?)
        end
    end

    if psely == 63 then
        if key == 'return' then
            state = g -- change state to learn
            state.load()
        end
    end

    if psely == 113 then
        if key == 'return' then
            state = h --change state to select (reloads game state)
            state.load()
        end
    end

end

return pause