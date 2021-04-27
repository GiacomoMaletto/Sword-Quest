local input = {}

function input.load(input)
  input.t = 0
  input.dt = 1/60
  input.mouse = {x=0, y=0, state1=0, state2=0}
  input.keyboard = {z=0, x=0, w=0, a=0, s=0, d=0, shift=0}
  
  input.sw, input.sh = love.graphics.getDimensions()
end

function input.getState(oldState, input)
  local newState = oldState
  if input then
    if oldState == 0 then
      newState = 1
    elseif oldState == 1 then
      newState = 2
    end
  else
    if oldState == 1 or oldState == 2 then
      newState = 3
    elseif oldState == 3 or oldState == -1 then
      newState = 0
    end
  end
  return newState
end

function input.update(input, dt)
  input.dt = dt
  input.t = input.t + input.dt

  input.mouse.x, input.mouse.y = love.mouse.getPosition()
  input.mouse.state1 = input.getState(input.mouse.state1, love.mouse.isDown("1"))
  input.mouse.state2 = input.getState(input.mouse.state2, love.mouse.isDown("2"))
  input.keyboard.z = input.getState(input.keyboard.z, love.keyboard.isDown("z"))
  input.keyboard.x = input.getState(input.keyboard.x, love.keyboard.isDown("x"))
  input.keyboard.w = input.getState(input.keyboard.w, love.keyboard.isDown("w"))
  input.keyboard.a = input.getState(input.keyboard.a, love.keyboard.isDown("a"))
  input.keyboard.s = input.getState(input.keyboard.s, love.keyboard.isDown("s"))
  input.keyboard.d = input.getState(input.keyboard.d, love.keyboard.isDown("d"))
  input.keyboard.shift = input.getState(input.keyboard.shift, love.keyboard.isDown("lshift"))
end

return input