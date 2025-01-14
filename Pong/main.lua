playerSize = {}
playerSize.height= 80 
playerSize.width = 15 

balle = {}
balle.posX = 50
balle.posY = 10
balle.width = 20
balle.height = 20
balle.speedX = 2
balle.speedY = 2

rightPlayer = {}
rightPlayer.height= playerSize.height 
rightPlayer.width = playerSize.width 
rightPlayer.posX = 40
rightPlayer.posY = 10 
rightPlayer.speed = 100 

leftPlayer = {}
leftPlayer.height= playerSize.height 
leftPlayer.width = playerSize.width 
leftPlayer.posX = 10
leftPlayer.posY = 10
leftPlayer.speed = 100 
 

screen = {}
screen.width = 0
screen.height = 0

function love.load()
    -- Set screen size in local variable
    screen.height = love.graphics.getHeight()
    screen.width = love.graphics.getWidth()

    -- Calcule start position of player right
    rightPlayer.posX = screen.width - 10 - rightPlayer.width
    rightPlayer.posY = screen.height - 10 - rightPlayer.height
    
    -- Calcule  position of ball    
    balle.posX =  (screen.width / 2) - (balle.width / 2)
    balle.posY = (screen.height / 2) - (balle.height / 2)

    -- Log
    de = "Screen W : "..screen.width.." H : "..screen.height
    print(de)
end

function love.update()
    movingPlayerLeft()
    moveBall()
end

function love.draw()
    initPlayer()
    initBall()
end


function initPlayer()
    -- Image player right
    love.graphics.rectangle("fill", rightPlayer.posX, rightPlayer.posY,  rightPlayer.width, rightPlayer.height)

    -- Image player left
    love.graphics.rectangle("fill", leftPlayer.posX, leftPlayer.posY, leftPlayer.width, leftPlayer.height)
end
function movingPlayerLeft()
    if love.keyboard.isDown("z") then
        newPosY = leftPlayer.posY - 5 
        if newPosY > 0 then
            leftPlayer.posY = leftPlayer.posY - 10        
        end
    end

    if love.keyboard.isDown("s") then
        newPosY = leftPlayer.posY + leftPlayer.height + 5 
        if newPosY < screen.height then
            leftPlayer.posY = leftPlayer.posY + 10       
        end
    end

end

function initBall()
    love.graphics.rectangle("fill",balle.posX, balle.posY, balle.width,  balle.height)
end
function moveBall()
    if balle.posY == 0 then
        balle.speedY = 2
    end
    if (balle.posY + balle.height) == screen.height then
        balle.speedY = -2
    end

    if balle.posX == 0 then
        balle.speedX = 2
    end
    if (balle.posX + balle.width) == screen.width then
        balle.speedX = -2
    end


    balle.posX = balle.posX + balle.speedX 
    balle.posY = balle.posY + balle.speedY
end

