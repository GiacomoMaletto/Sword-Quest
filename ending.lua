local ending = {}
ending.t = 0
ending.state = "texty"


local endingImg = love.graphics.newImage("img/ending/title.png")
local doggo = love.graphics.newImage("img/ending/doggo.png")

function ending.update(ending, dt, main, input)
  ending.t = ending.t + dt

  if ending.state == "texty" then
    if ending.t > ending.text[1][ending.text.state] then
      ending.text.state = ending.text.state + 1
      ending.t = 0
      if ending.text.state == 4 then
        table.remove(ending.text, 1)
        ending.text.state = 1
        if #ending.text == 0 then
          ending.state = "still"
          gif = love.graphics.newVideo("img/ending/gif.ogv", {false})
          gif:play()
        end
      end
    end
  end

  if ending.state == "gif" then
    if not gif:isPlaying() then
      ending.state = "still"
    end
  end
end


ending.text = {state=1}
ending.text[1] = {text="Billy  was  not  the  rightful  king...", 1, 3, 1}
ending.text[2] = {text="He  ruled  for  about  one  day  \nbefore  Britain's  economy  and  society  collapsed.", 1, 4, 1}
ending.text[3] = {text="And  fun  fact,  from  that  point  on,  no  ruler  in  Britain  has  ever  been  rightful.", 1, 6, 1}
ending.text[4] = {text="About  the  sword...  It  just  fell  deeper  and  deeper,  and  eventually...", 1, 4, 1}

function ending.draw(ending)
  if ending.state == "texty" then
    if ending.text.state == 1 then
      love.graphics.setColor(1, 1, 1, ending.t / ending.text[1][1])
    elseif ending.text.state == 2 then
      love.graphics.setColor(1, 1, 1, 1)
    elseif ending.text.state == 3 then
      love.graphics.setColor(1, 1, 1, 1 - ending.t / ending.text[1][3])
    end

    love.graphics.setFont(mediumFont)
    love.graphics.printf(ending.text[1].text, sw/10, sh*3/4, sw*8/10, "center")
  end

  love.graphics.setColor(1, 1, 1)
  if ending.state == "gif" then
    love.graphics.draw(gif, 0, 0)
  end

  if ending.state == "still" then
    love.graphics.setColor(1, 1, 1)
    love.graphics.draw(endingImg)
    love.graphics.draw(doggo, sw*1/20, sh*5/10, 0, 0.2)

    love.graphics.setColor(0, 0, 0)
    love.graphics.setFont(mediumFont)
    love.graphics.print("(it  really  exists!  Google  it  if  you  want)", sw*1/4, sh*2/10)
    love.graphics.setFont(bigFont)
    love.graphics.print("Made  by  Alice,  Giacomo  &  Michele  :D", sw*2/10, sh*4/10)
    love.graphics.setFont(mediumFont)
    love.graphics.print("Special  thanks  to  our  little  bitch", sw*1/3, sh*7.5/10)

  end
end

return ending