screen = {}
screen.width = 0
screen.height = 0

player = {}

enemy = {}


function love.load()
    screen.height = love.graphics.getHeight()
    screen.width = love.graphics.getWidth()

    player = CreateSprite("Human","player_",4)
    player.x = screen.width / 2 - player.width / 2
    player.y = screen.height / 2 - player.height / 2
    
    -- Log
    de = "Screen W : "..screen.width.." H : "..screen.height
    de = "\nSize :"..table.getn(player.frames)
    print(de)
end

function love.update(dt)
    movePlayer(dt)
end

function love.draw()
    showPlayer()
  
end

function showPlayer()     
    love.graphics.draw(player.frames[math.floor(player.currentFrame)], player.x - player.width / 2, player.y - player.height / 2)
end
function movePlayer(dt)
    if love.keyboard.isDown("up") then
        player.y = player.y - 1
        animationPlayer()
    end
    if love.keyboard.isDown("down") then
        player.y = player.y + 1
        animationPlayer()
    end

end

function animationPlayer()
    speedAnim = 0.25 
    if player.currentFrame + speedAnim < table.getn(player.frames) + 1  then
        player.currentFrame =  player.currentFrame + speedAnim
    else
        player.currentFrame = 1
    end
end

function CreateSprite(pType, pFrame, pFrameCountMax)
    sprite = {}
    sprite.type = pType
    sprite.currentFrame = 1    
    sprite.frames = {}
    local i
    for i=1, pFrameCountMax do
        img = "Image/"..pFrame..tostring(i)..".png" 
        sprite.frames[i] = love.graphics.newImage(img)
        print(sprite.frames[i])
    end
    sprite.width = sprite.frames[1]:getWidth()  
    sprite.height = sprite.frames[1]:getHeight()
    sprite.x = 0
    sprite.y = 0

    return sprite
end