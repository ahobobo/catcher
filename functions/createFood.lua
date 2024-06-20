
function createFood()
    love.math.setRandomSeed(love.timer.getTime())
    local x = love.math.random(screenWidth) - 1
    local y = 0

    table.insert(listOfBullets, Bullet:new({}, x, y))
end