local people = {list={}}

function people.generateCircle(people, N, group, cx, cy, r, R)
  for i = 1, N do
    local x, y
    repeat
      x, y = R*(2*love.math.random()-1), R*(2*love.math.random()-1)
    until (r^2 <= x^2+y^2 and x^2+y^2<=R^2)
    people.list[#people.list+1] = {
      x = math.floor( x + cx ), y = math.floor( y + cy ),
      group = group, t = 0, state = "normal",
    }
  end
end

function people.generateRectangle(people, N, group, x1, x2, y1, y2)
  for i = 1, N do
    local x = love.math.random(x1, x2)
    local y = love.math.random(y1, y2)
    people.list[#people.list+1] = {x=x, y=y, group=group, t=0, state="normal"}
  end
end

people.img = {["rest"]={}, ["walk"]={}}
people.img["rest"][1] = love.graphics.newImage("img/char/01.png")

people.img["walk"][1] = love.graphics.newImage("img/char/02.png")
people.img["walk"][2] = love.graphics.newImage("img/char/03.png")

return people