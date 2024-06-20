
function love.load()
    require "functions.createFood"
    require "classes.entity"
    require "classes.player"
    require "classes.enemy"
    require "classes.bullet"

    screenWidth, screenHeight = love.graphics.getDimensions()
    score = 0
    foodInterval = 2
    foodTotal = 0

    player = Player:new()
    enemy = Enemy:new()
    listOfBullets = {}
end

function love.keypressed(key)
    if key == "f2" then
        love.load()
    end
    if key == "f3" then
        love.event.quit(0)
    end
    player:keyPressed(key)
end


function love.update(dt)
    foodTotal = foodTotal + dt
    if foodTotal >= foodInterval then
        createFood()
        foodTotal = 0
    end
        
    player:update(dt)
    enemy:update(dt)

    for i,v in ipairs(listOfBullets) do
        v:update(dt)
        v:checkCollision(enemy)

        if v.dead then
            table.remove(listOfBullets, i)
        end
    end
end

function love.draw()
    love.graphics.print("Current Score: " .. score, 10, 10)

    player:draw()

    for i,v in ipairs(listOfBullets) do
        v:draw()
    end
end
