-- Cette ligne permet d'afficher des traces dans la console pendant l'éxécution
io.stdout:setvbuf('no')

playerSize = {}
playerSize.height= 80 
playerSize.width = 15 

balle = {}
balle.posX = 50
balle.posY = 10
balle.width = 20
balle.height = 20
balle.speedX = 1
balle.speedY = 1

rightPlayer = {}
rightPlayer.height= playerSize.height 
rightPlayer.width = playerSize.width 
rightPlayer.posX = 40
rightPlayer.posY = 10 
rightPlayer.speed = 20 

leftPlayer = {}
leftPlayer.height= playerSize.height 
leftPlayer.width = playerSize.width 
leftPlayer.posX = 10
leftPlayer.posY = 10
leftPlayer.speed = 20 
 
score = {}
score.left = 0
score.right = 0

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
    randomLaunchBall()

    -- Log
    de = "Screen W : "..screen.width.." H : "..screen.height
    print(de)

    arrayX = {1,-1}
    arrayY = {1,-1}
end

function love.update()
    movingPlayerLeft()
    movingPlayerRight()
    moveBall()
end

function love.draw()
    initPlayer()
    initBall()
    setScore()
end

function setScore()
    textPrint = tostring(score.left).." : "..tostring(score.right)
    font = love.graphics.getFont()

    love.graphics.print(textPrint, screen.width/2 - font:getWidth(textPrint), 10)
end
function scoring(scoreLeft, scoreRight)
    if scoreLeft == true then
        score.left = score.left + 1  
        resetBall()
    elseif scoreRight == true then
        score.right = score.right + 1  
        resetBall()
    end

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
            leftPlayer.posY = leftPlayer.posY - 5        
        end
    end

    if love.keyboard.isDown("s") then
        newPosY = leftPlayer.posY + leftPlayer.height + 5 
        if newPosY < screen.height then
            leftPlayer.posY = leftPlayer.posY + 5       
        end
    end

end
function movingPlayerRight()
    if love.keyboard.isDown("up") then
        newPosY = rightPlayer.posY - 5 
        if newPosY > 0 then
            rightPlayer.posY = rightPlayer.posY - 5        
        end
    end

    if love.keyboard.isDown("down") then
        newPosY = rightPlayer.posY + rightPlayer.height + 5 
        if newPosY < screen.height then
            rightPlayer.posY = rightPlayer.posY + 5       
        end
    end

end

function initBall()
    love.graphics.rectangle("fill",balle.posX, balle.posY, balle.width,  balle.height)
end
function resetBall()
    -- Calcule  position of ball    
    balle.posX =  (screen.width / 2) - (balle.width / 2)
    balle.posY = (screen.height / 2) - (balle.height / 2)

    randomLaunchBall()    
end
function randomLaunchBall()
    --Random launch
    arrayX = {1,-1}
    arrayY = {1,-1}
    balle.speedX = arrayX[math.random(1,2)]
    balle.speedY = arrayY[math.random(1,2)]
end

function moveBall()
    if balle.posX <= leftPlayer.posX + leftPlayer.width and balle.posY + balle.height > leftPlayer.posY and balle.posY < leftPlayer.posY + leftPlayer.height then
        --Up speed
        balle.speedX = balle.speedX - 0.5
        -- Switch direction
        balle.speedX = -balle.speedX   

        balle.posX = leftPlayer.posX + leftPlayer.width       
    elseif balle.posX + balle.width >= rightPlayer.posX and balle.posY + balle.height > rightPlayer.posY and balle.posY < rightPlayer.posY + rightPlayer.height then
        --Up speed
        balle.speedX = balle.speedX + 0.5
        -- Switch direction
        balle.speedX = balle.speedX * -1   
        balle.posX = rightPlayer.posX - balle.width  
    else   
        if balle.posY <= 0 then
            --Set positif
            balle.speedY =  -balle.speedY
        end
        if (balle.posY + balle.height) == screen.height then
            --Set negatif
            balle.speedY = balle.speedY * -1
        end
    
        if balle.posX <= 0 then
            --Set positif
            balle.speedX = -balle.speedX
            scoring(false,true)
        end
        if (balle.posX + balle.width) >= screen.width then
            --Set negatif
            balle.speedX = balle.speedX * -1
            
            scoring(true,false)
        end
    end 


    balle.posX = balle.posX + balle.speedX 
    balle.posY = balle.posY + balle.speedY
end

