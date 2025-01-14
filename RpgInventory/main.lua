screen = {}
screen.width = 0
screen.height = 0


function love.load()
    screen.height = love.graphics.getHeight()
    screen.width = love.graphics.getWidth()

    
    -- Log
    de = "Screen W : "..screen.width.." H : "..screen.height
    print(de)
end

function love.update()
end

function love.draw()
end