local guard = {
  type = "guard",
  state = "rest",
  n = 1, dir = "d", t = 0
}

function guard.update(guard, dt, game, input)
  if not guard.target and game.guard.cone then
    game.entity.newTarget(guard, guard.x2, guard.y2, 10)
    game.entity.newTarget(guard, guard.x1, guard.y1, 10)
  end

  if game.guard.cone then
    local dx = game.char.x - guard.x
    local dy = game.char.y - guard.y
    if game.getDir(dx, dy) == guard.dir and game.entity.distance(game.char, guard) < 70 then
      if game.caught == false then game.caught = true end
    end
  end
end

return guard