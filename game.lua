game = {}

b = require 'blocks'
d = require 'dead'

function game.load()
    player = love.graphics.newImage('playersprite.png')
    x = 10
    y = 314

    right = true 
    left = false
    jump = false
    jump_power = -100
    shoot = false
    slash = true
    gravity = 3

    blank = love.graphics.newImage('blank.png')

    heart = love.graphics.newImage('heartfilled.png')
    health = 4
    health_max = 4

    screen = 1

end

function game.update()
    if right == true then
        if love.keyboard.isDown('d') then
            x = x + 2
        end
    end

    if left == true then
        if love.keyboard.isDown('a') then
            x = x - 2
        end
    end

    --y = y + gravity


    if health <= 0 then
        state = d
        state.load()
    end

end

function game.draw()
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle('fill', 0, 384, 816, 216)
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(player, x, y)

    love.graphics.draw(blank, 0, 0)
    love.graphics.draw(blank, 50, 0)
    love.graphics.draw(blank, 100, 0)
    love.graphics.draw(blank, 150, 0)

    if health >= 4 then
        love.graphics.draw(heart, 150, 0)
    end

    if health >= 3 then
        love.graphics.draw(heart, 100, 0)
    end

    if health >= 2 then
        love.graphics.draw(heart, 50, 0)
    end

    if health >= 1 then
        love.graphics.draw(heart, 0, 0)
    end

    love.graphics.draw(blank, 0, 550)
    love.graphics.print("1", 20, 535)
    love.graphics.draw(blank, 50, 550)
    love.graphics.print("2", 70, 535)
    love.graphics.draw(blank, 100, 550)
    love.graphics.print("3", 120, 535)
    love.graphics.draw(blank, 150, 550)
    love.graphics.print("4", 170, 535)

end

function game.keypressed(key)
    if key == 'escape' then
        state = p
        state.load()
    end

    if key == 'e' then
        health = health - 1 
    end

    if jump == true then
        if key == 'space' then
            y = y + jump_power
        end
    end
end

return game