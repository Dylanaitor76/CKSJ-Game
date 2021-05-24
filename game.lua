game = {}

b = require 'blocks'
d = require 'dead'

function game.load()
    player = love.graphics.newImage('playersprite.png')
    playerx = 20
    playery = -50

    right = true 
    left = false
    jump = false
    jumps = 0
    doublejump = false
    gravity = -10

    equip = 0

    shoot = false
    projectiles = {}
    projectiles[1] = makeProjectile()

    slash = false

    item1 = false
    item1x = 400
    item1y = 314
    item2= false
    item2x = 40
    item2y = 314
    item3 = false
    item3x = 350
    item3y = 200
    item4 = false
    item4x = 700
    item4y = 314

    blank = love.graphics.newImage('blank.png')

    heart = love.graphics.newImage('heartfilled.png')
    health = 4
    health_max = 4

    screen = 1

end

function game.update(dt)
    
    if screen == 1 then
        if playerx == 760 then
            screen = 2
            playerx = 20
        elseif playerx == 10 then
            screen = -1
            playerx = 750
        end
    elseif screen == 2 then
        if playerx == 760 then
            screen = 3
            playerx = 20
        elseif playerx == 10 then
            screen = 1
            playerx = 750
        end
    elseif screen == 3 then
        if playerx == 10 then
            screen = 2
            playerx = 750
        elseif playerx >= 760 then
            playerx = 760
        end
    elseif screen == -1 then
        if playerx == 760 then
            screen = 1
            playerx = 20
        elseif playerx <= 10 then
            playerx = 10
        end
    end

    for i=1, #projectiles do
        projectiles[i].x = projectiles[i].x + projectiles[i].speed
        projectiles[i].dist = projectiles[i].dist + projectiles[i].speed
        if projectiles[i].dist > 400 then
            projectiles[i].speed = 0
            projectiles[i].y = -100
        end
    end

    if right == true then
        if love.keyboard.isDown('d') then
            playerx = playerx + 2
        end
    end

    if left == true then
        if love.keyboard.isDown('a') and equip == 1 then
            playerx = playerx - 2
        end
    end

    playery = playery + gravity

    if gravity < 15 then
        gravity = gravity + 0.5
    end

    if playery >= 314 then
        gravity = 0
        playery = 314
        jumps = 0
    end


    if health <= 0 then
        state = d
        state.load()
    end

end

function game.draw()
    love.graphics.setColor(0, 0, 1)
    love.graphics.rectangle('fill', 0, 384, 816, 216)
    
    love.graphics.setColor(1,0,0)

    if screen == 1 then
        love.graphics.rectangle('fill', item1x, item1y , 10, 10)
        if playerx == item1x - 20 and playery <= item1y then
            item1y = -100
        end
    end
    
    if screen == -1 then
        love.graphics.rectangle('fill', item2x, item2y , 10, 10)
        if playerx == item2x and playery <= item2y then
            item2y = -100
        end
    end

    if screen == 2 then
        love.graphics.rectangle('fill', item3x, item3y , 10, 10)
        if playerx == item3x - 20 and playery <= item3y then
            item3y = -100
        end
    end

    if screen == 3 then
        love.graphics.rectangle('fill', item4x, item4y , 10, 10)
        if playerx == item4x and playery <= item4y then
            item4y = -100
        end
    end


    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(player, playerx, playery)
    love.graphics.print(screen, 300, 300)
    love.graphics.print(playery, 310, 310)
    love.graphics.print(playerx, 305, 305)

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
    if item1y == -100 then
        love.graphics.setColor(1, 0, 0)
        item1 = true
        left = true
        love.graphics.rectangle('fill', 15, 565, 20, 20)
        love.graphics.setColor(1, 1, 1)
    end
    if equip == 1 then
        love.graphics.setColor(1, 0, 0)
        love.graphics.print("1", 20, 535)
        love.graphics.setColor(1, 1, 1)
    end
    love.graphics.draw(blank, 50, 550)
    love.graphics.print("2", 70, 535)
    if item2y == -100 then
        love.graphics.setColor(1, 0, 0)
        item2 = true
        jump = true
        love.graphics.rectangle('fill', 65, 565, 20, 20)
        love.graphics.setColor(1, 1, 1)
    end
    if equip == 2 then
        love.graphics.setColor(1, 0, 0)
        love.graphics.print("2", 70, 535)
        love.graphics.setColor(1, 1, 1)
    end
    love.graphics.draw(blank, 100, 550)
    love.graphics.print("3", 120, 535)
    if item3y == -100 then
        love.graphics.setColor(1, 0, 0)
        item3 = true
        shoot = true
        slash = true
        love.graphics.rectangle('fill', 115, 565, 20, 20)
        love.graphics.setColor(1, 1, 1)
    end
    if equip == 3 then
        love.graphics.setColor(1, 0, 0)
        love.graphics.print("3", 120, 535)
        love.graphics.setColor(1, 1, 1)
    end
    love.graphics.draw(blank, 150, 550)
    love.graphics.print("4", 170, 535)
    if item4y == -100 then
        love.graphics.setColor(1, 0, 0)
        item4 = true
        doublejump = true
        love.graphics.rectangle('fill', 165, 565, 20, 20)
        love.graphics.setColor(1, 1, 1)
    end
    if equip == 4 then
        love.graphics.setColor(1, 0, 0)
        love.graphics.print("4", 170, 535)
        love.graphics.setColor(1, 1, 1)
    end
    
    for i=1, #projectiles do
        love.graphics.rectangle('fill', projectiles[i].x, projectiles[i].y, 20, 20)
    end

end

function game.keypressed(key)
    if key == 'escape' then
        state = p
        state.load()
    end

    if key == 'q' then
        health = health - 1 
    end
    if doublejump == true then 
        if jump == true then
            jumps = jumps + 1
            if key == 'space' and jumps <= 2 and equip == 2 then
                gravity = -12
            end
        end
    else
        if jump == true then
            if key == 'space' and jumps <= 1 and equip == 2 then
                jumps = jumps + 1
                gravity = -12
            end
        end
    end

    if shoot == true then
        if key == 'e' and equip == 4 then
            projectiles[#projectiles + 1] = makeProjectile()
        end
    end



    if item1 == true then
        if key == '1' then
            equip = 1
        end
    end

    if item2 == true then
        if key == '2' then
            equip = 2
        end
    end

    if item3 == true then
        if key == '3' then
            equip = 3
        end
    end

    if item4 == true then
        if key == '4' then
            equip = 4
        end
    end


    if equip == 1 then
        if shoot == true then
            if key == 'r' then
                shoot = false
                slash = true
            end
        elseif slash == true then
            if key == 'r' then
                slash = false
                shoot = true
            end
        end
    elseif equip == 2 then
        if shoot == true then
            if key == 'r' then
                shoot = false
                slash = true
            end
        elseif slash == true then
            if key == 'r' then
                slash = false
                shoot = true
            end
        end
    elseif equip == 3 then
        if shoot == true then
            if key == 'r' then
                shoot = false
                slash = true
            end
        elseif slash == true then
            if key == 'r' then
                slash = false
                shoot = true
            end
        end
    elseif equip == 4 then
        if shoot == true then
            if key == 'r' then
                shoot = false
                slash = true
            end
        elseif slash == true then
            if key == 'r' then
                slash = false
                shoot = true
            end
        end
    end
end

function makeProjectile() 
    local pr = {
        speed = 20,
        dist = 0,
        accelx = 0.5,
        --img = newImage(..),
        x = playerx,
        y = playery + 30
    }
    return pr

end

return game