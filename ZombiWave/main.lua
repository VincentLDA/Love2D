screen = {}
screen.width = 0
screen.height = 0

player = {}

enemy = {}


function love.load()
    screen.height = love.graphics.getHeight()
    screen.width = love.graphics.getWidth()

    player = initPlayer()
    -- Log
    de = "Screen W : "..screen.width.." H : "..screen.height
    print(de)
end

function love.update(dt)
end

function love.draw()
end

function initPlayer()

end


function initEnemy()

end
