local char = {
  type = "char",
  x=993.3442079954, y=562.50910799223,
  state = "rest",
  n = 1, dir = "w", t = 0
}

function char.update(char, dt, game, input)
  if game.cutscene or #game.dialogue>0 or game.blackout then return nil end

  local dir
  if love.keyboard.isDown("up") then dir = "w"
  elseif love.keyboard.isDown("left") then dir = "a"
  elseif love.keyboard.isDown("down") then dir = "s"
  elseif love.keyboard.isDown("right") then dir = "d" end
  if dir then
    game.entity.setState(char, "walk")
    char.dir = dir

    local v = 60
    if input.keyboard.shift>1 then v = 500 end
    local xTable = {w=0, a=-1, s=0, d=1}
    local yTable = {w=-1, a=0, s=1, d=0}
    local newX = char.x + xTable[dir]*v*dt
    local newY = char.y + yTable[dir]*v*dt
    if game.pointInPolygon(game.polygon[1], newX, newY) and
      not game.pointInPolygon(game.polygon[2], newX, newY) and
      not game.pointInPolygon(game.polygon[3], newX, newY) and
      not game.pointInPolygon(game.polygon[4], newX, newY) and
      not game.pointInPolygon(game.polygon[5], newX, newY) then
      char.x, char.y = newX, newY
    end

    if char.t < .2 then
      char.n = 1
    elseif char.t < .4 then
      char.n = 2
    else char.t = char.t - .4 end
  else
    game.entity.setState(char, "rest")
  end


end

return char