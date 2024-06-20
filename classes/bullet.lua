
Bullet = Entity:new()

function Bullet:new(o, x, y)
    o = o or {}
    setmetatable(o, self)
    self.__index = self
    self.x = x
    self.y = y
    self.speed = 700
    self.width = 10
    self.height = 50
    return o
end

function Bullet:update(dt)
    self.y = self.y + self.speed * dt

    if self.y > love.graphics.getHeight() then
        love.load()
    end
end

function Bullet:draw()
    love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

function Bullet:checkCollision(obj)

    if Entity.checkCollision(self, obj) then
        self.dead = true

        --Increase enemy speed
        if obj.speed > 0 then
            obj.speed = obj.speed + 50
        else
            obj.speed = obj.speed - 50
        end
    end
end

