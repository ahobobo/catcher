
Player = {}

function Player:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.x = screenWidth / 2 - (150 / 2)
    self.y = screenHeight - 100
    self.speed = 300
    self.width = 150
    self.height = 150
    return o
end

function Player:update(dt)
    if love.keyboard.isDown("left") then
        self.x = self.x - self.speed * dt
    elseif love.keyboard.isDown("right") then
        self.x = self.x + self.speed * dt
    end

    local window_width = love.graphics.getWidth()

    if self.x < 0 then
        self.x = 0
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
    end
end

function Player:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function Player:keyPressed(key)
    if key == "space" then
        table.insert(listOfBullets, Bullet:new(nil, self.x + (self.width / 2), self.y + self.width))
    end
end

