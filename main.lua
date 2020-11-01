-- This is the aspect ratio
 game_width = 1280
 game_height = 720
 
 --this is initial y of the players
 playerOneY = 120
 playerTwoY = game_height - 240
 
 --change of y variable ( hmmmm )
 movementOfY = 200
 
 function love.load()
   love.window.setMode(game_width, game_height, {
       fullscreen = false,
       resizable = false,
       vsync = true
     })
   love.graphics.setBackgroundColor(1, 1, 1, 1)
 end
 function love.update(dt)
   if love.keyboard.isDown('w') then
     playerOneY =math.max(20, playerOneY + -movementOfY * dt)
   elseif love.keyboard.isDown('s') then
     playerOneY =math.min(game_height - 160, playerOneY + movementOfY * dt)
   end
   
   if love.keyboard.isDown('up') then
     playerTwoY = math.max(20, playerTwoY + -movementOfY * dt)
   elseif love.keyboard.isDown('down') then
     playerTwoY = math.min(game_height - 160, playerTwoY + movementOfY * dt)
   end
   
 end
  function love.keypressed(key)
   if key == 'escape' then
     love.event.quit()
    end
  end
  
  --My current attempt in creating A function (it does'nt work)
 --[[
 function boarderDraw()
  love.graphics.setColor(60, 60, 60, 1)
  love.graphics.rectangle('fill', 1, 1, 25, game_height)
 end
]]--

function love.draw()
   --boarderDraw()
   love.graphics.setColor(0, 0, 0, 1)
   love.graphics.printf(
     "PONG GAME",
     0,
     (game_height/2) - 6,
     game_width,
     'center'
    )
    love.graphics.rectangle('line', 0, 0, game_width, game_height)
    love.graphics.rectangle('fill', 40, playerOneY, 25, 150)
    love.graphics.rectangle('fill', game_width-80, playerTwoY, 25, 150)
    
end

