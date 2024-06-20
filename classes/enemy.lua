
Enemy = {}

function Enemy:new(o)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.x = 325
    self.y = 450
    self.speed = 500
    self.width = 200
    self.height = 100
    return o
end

function Enemy:update(dt)
    self.x = self.x + self.speed * dt

    local window_width = love.graphics.getWidth()

    if self.x < 0 then
        self.x = 0
        self.speed = -self.speed
    elseif self.x + self.width > window_width then
        self.x = window_width - self.width
        self.speed = -self.speed
    end
end

function Enemy:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

