local menu = {}
menu.t = 0
menu.state = "press"


local menuImg = love.graphics.newImage("img/menu/title.png")
local stillImg = love.graphics.newImage("img/menu/still.png")

function menu.update(menu, dt, main, input)
  menu.t = menu.t + dt

  if menu.state == "press" then
    if input.keyboard.z == 1 then
      menu.state = "still"
      menu.t = 0
    end
  end

  if menu.state == "still" then
    if menu.t > menu.text[1][menu.text.state] then
      menu.text.state = menu.text.state + 1
      menu.t = 0
      if menu.text.state == 4 then
        table.remove(menu.text, 1)
        menu.text.state = 1
        if #menu.text == 0 then
          menu.state = "gif"
          gif = love.graphics.newVideo("img/menu/gif.ogv", {false})
          gif:play()
        end
      end
    end
  end

  if menu.state == "gif" then
    if not gif:isPlaying() then
      main.state = "game"
    end
  end
end


menu.text = {state=1}
menu.text[1] = {text="Long  ago,  in  a  land  called  Britain,", 1, 3, 1}
menu.text[2] = {text="there  was  only  one  way  to  inherit  the  throne  \n  and  become  the  true  ruler:", 1, 4, 1}
menu.text[3] = {text="extracting  Excalibur  from  its  sacred  seat  in  front  of  the  RBEEP  \n  (Royal  Bureau  For  Excalibur  Extraction  Protocol).", 1, 6, 1}
menu.text[4] = {text="Unfortunately,  during  that  fatal  day,  time  was  running  out...", 1, 4, 1}

function menu.draw(menu)
  if menu.state == "press" then
    love.graphics.draw(menuImg)
    if math.floor(menu.t*2)%2==0 then
      love.graphics.setFont(bigFont)
      love.graphics.print("PRESS  Z  TO  PLAY", sw/20, sh*5/6)
    end
  end

  if menu.state == "still" then
    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.draw(stillImg)
    
    if menu.text.state == 1 then
      love.graphics.setColor(1, 1, 1, menu.t / menu.text[1][1])
    elseif menu.text.state == 2 then
      love.graphics.setColor(1, 1, 1, 1)
    elseif menu.text.state == 3 then
      love.graphics.setColor(1, 1, 1, 1 - menu.t / menu.text[1][3])
    end

    love.graphics.setFont(mediumFont)
    love.graphics.printf(menu.text[1].text, sw/10, sh*3/4, sw*8/10, "center")
  end

  love.graphics.setColor(1, 1, 1)
  if menu.state == "gif" then
    love.graphics.draw(gif, 0, 0)
  end
end

return menu