 Class = require 'class'
 require 'paddles'
 require 'ball'
 require 'menu'
 
 main = Class{}
 
 -- This is the aspect ratio
 game_width = 1280
 game_height = 720
 
 --change of y variable ( hmmmm )
 movementOfY = 350
 menu = menu()
 
 function love.load()
   menu:store()
   math.randomseed(os.time()) --this is for math.random()

   PlayerOneScore = 0
   PlayerTwoScore = 0
   
   paddlePlayerOne = paddles(40, 120, 25, 150)
   paddlePlayerTwo = paddles(game_width-80, game_height - 240, 25, 150)
   
   playBall = ball(game_width/2, game_height/2, 20)
   
   gameState = 'start'
 end
 
 function love.update(dt)
   
   if gameState == 'play' then
     
     --this handles the collision of the ball to the paddle
     if playBall:collision(paddlePlayerOne) then
       playBall.dx = -playBall.dx * 1.1
       playBall.x = paddlePlayerOne.x + 35
       
       if playBall.dy < 0 then
         playBall.dy = -math.random(25, 250)
       else
         playBall.dy = math.random(25, 250)
       end
     end
     
     if playBall:collision(paddlePlayerTwo) then
       playBall.dx = -playBall.dx * 1.1
       playBall.x = paddlePlayerTwo.x - 20
       
       if playBall.dy < 0 then
         playBall.dy = -math.random(25, 250)
       else
         playBall.dy = math.random(25, 250)
       end
       
     end
     
     --this handles the collision of the ball in respect to y
     if playBall.y <= 0 then
       playBall.y = 0
       playBall.dy = -playBall.dy
     end
     
     if playBall.y >= game_height then
       playBall.y = game_height
       playBall.dy = -playBall.dy
      end
       
   end 
   
   --this handles the reset of the ball
   if playBall.x < 0 then --conditional operator of the ball's x
     ServingPlayer = 1
     PlayerTwoScore = PlayerTwoScore + 1
     playBall:reset()
     gameState = 'start'
   end
   
   if playBall.x > game_width then
     ServingPlayer = 2
     PlayerOneScore = PlayerOneScore + 1
     playBall:reset()
     gameState = 'start'
   end 
     
-- this handles controls the paddle
  if love.keyboard.isDown('w') then
     paddlePlayerOne.dy = -movementOfY
   elseif love.keyboard.isDown('s') then
     paddlePlayerOne.dy = movementOfY
    else
      paddlePlayerOne.dy = 0
   end
   
   if love.keyboard.isDown('up') then
     paddlePlayerTwo.dy = -movementOfY
   elseif love.keyboard.isDown('down') then
     paddlePlayerTwo.dy = movementOfY
   else
      paddlePlayerTwo.dy = 0
   end
   
   if gameState == 'play' then
     playBall:update(dt)
   end
   
   paddlePlayerOne:update(dt)
   paddlePlayerTwo:update(dt)
   
   
 end
  
 function love.keypressed(key)
   if key == 'escape' then
     love.event.quit()
    elseif key == 'enter' or key == 'return' then
      if gameState == 'start' then
        gameState = 'play'
      else
        gameState = 'start'
        playBall:reset()
      end
    end
 end
  

function love.draw()
   menu:draw()
end

function play_Game()
  love.graphics.setColor(0, 0, 0, 1)
  love.graphics.printf(
    "PONG GAME",
    game_width/2 - 25,
    25,
    game_width
    --'center'
  )
  love.graphics.rectangle('line', 0, 0, game_width, game_height)
  -- love.graphics.circle('fill', game_width/2, game_height/2, 20)
  paddlePlayerOne:render()
  paddlePlayerTwo:render()
  playBall:render()
    
  fpsDisplay()
end

function fpsDisplay()
  love.graphics.setColor(0, 255/255, 0, 255/255)
  love.graphics.print('FPS : ' .. tostring(love.timer.getFPS()), 10, 10)
end
