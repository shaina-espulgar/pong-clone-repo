-- commento desu
 game_width = 1280
 game_height = 720
 function love.load()
   love.window.setMode(game_width, game_height, {
       fullscreen = false,
       resizable = false,
       vsync = true
       })
 end
 function love.update(dt)
   --commento desu
   
 end
  function love.keypressed(key)
   if key == 'escape' then
     love.event.quit()
    end
  end
 
 function love.draw()
   love.graphics.clear(60/255, 60/255, 60/255, 255/255) 
   love.graphics.printf(
     "PONG GAME",
     0,
     (game_height/2) - 6,
     game_width,
     'center'
    )
    love.graphics.rectangle('fill', 40, 60, 25, 150)
    love.graphics.rectangle('fill', game_width-80, game_height-360, 25, 150)
    
end
  