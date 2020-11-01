
 Class = require 'class'
 require 'paddles'
 require 'ball'
 
 -- This is the aspect ratio
 game_width = 1280
 game_height = 720
 
 --change of y variable ( hmmmm )
 movementOfY = 250
 
 function love.load()
   math.randomseed(os.time())
   love.window.setMode(game_width, game_height, {
       fullscreen = false,
       resizable = false,
       vsync = true
     })
   love.graphics.setBackgroundColor(1, 1, 1, 1)
   
   paddlePlayerOne = paddles(40, 120, 25, 150)
   paddlePlayerTwo = paddles(game_width-80, game_height - 240, 25, 150)
   
   playBall = ball(game_width/2, game_height/2, 20)
   
   gameState = 'start'
 end
 
 function love.update(dt)

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
    
end

