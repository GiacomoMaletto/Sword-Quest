love.graphics.setDefaultFilter("nearest", "nearest")
sw, sh = love.graphics.getDimensions()
mediumFont = love.graphics.newFont("pixelated.ttf", 30)
mediumFont:setFilter( "nearest", "nearest" )
bigFont = love.graphics.newFont("pixelated.ttf", 40)
bigFont:setFilter( "nearest", "nearest" )
local main = {}
local game = require "game"
local menu = require "menu"
local input = require "input"
local ending = require "ending"
main.state = "menu"

function love.load()
  input:load()
  game:load()
end

local t = 0
local Dt = 0
function love.update(dt)
  if love.keyboard.isDown("escape") then
    love.event.quit()
  end

  Dt = dt
  t = t + dt

  input:update(dt)

  if main.state == "menu" then
    menu:update(Dt, main, input)
  end
  if main.state == "game" then
    game:update(Dt, main, input)
  end
  if main.state == "ending" then
    ending:update(Dt, main, input)
  end
end

function love.draw()
  if main.state == "game" then
    game:draw()
  elseif main.state == "menu" then
    menu:draw()
  elseif main.state == "ending" then
    ending:draw()
  end
end