local game = {}
local sw, sh = love.graphics.getDimensions()
local pw, ph = sw/4, sh/4
game.state = "beginning"--"backtoJanbon"--"firstBlackout"; game.blackout = {text="Second Day", t=0} --
game.day = 1
local direction_table = {
  ["s"]=math.rad(180),
  ["w"]=math.rad(0),
  ["d"]=math.rad(90),
  ["a"]=math.rad(270),
}
game.image = {}
game.image["char"] = {}
game.image["char"]["rest"] = {
  w = {love.graphics.newImage("img/char/rest w.png")},
  a = {love.graphics.newImage("img/char/rest a.png")},
  s = {love.graphics.newImage("img/char/rest s.png")},
  d = {love.graphics.newImage("img/char/rest d.png")},
}
game.image["char"]["walk"] = {
  w = {
    love.graphics.newImage("img/char/walk w 1.png"),
    love.graphics.newImage("img/char/walk w 2.png")},
  a = {
    love.graphics.newImage("img/char/walk a 1.png"),
    love.graphics.newImage("img/char/walk a 2.png")},
  s = {
    love.graphics.newImage("img/char/walk s 1.png"),
    love.graphics.newImage("img/char/walk s 2.png")},
  d = {
    love.graphics.newImage("img/char/walk d 1.png"),
    love.graphics.newImage("img/char/walk d 2.png")}
}
game.image["people"] = {}
game.image["people"]["rest"] = {
  w = {love.graphics.newImage("img/people/rest w.png")},
  a = {love.graphics.newImage("img/people/rest a.png")},
  s = {love.graphics.newImage("img/people/rest s.png")},
  d = {love.graphics.newImage("img/people/rest d.png")},
}
game.image["people"]["walk"] = {
  w = {
    love.graphics.newImage("img/people/walk w 1.png"),
    love.graphics.newImage("img/people/walk w 2.png")},
  a = {
    love.graphics.newImage("img/people/walk a 1.png"),
    love.graphics.newImage("img/people/walk a 2.png")},
  s = {
    love.graphics.newImage("img/people/walk s 1.png"),
    love.graphics.newImage("img/people/walk s 2.png")},
  d = {
    love.graphics.newImage("img/people/walk d 1.png"),
    love.graphics.newImage("img/people/walk d 2.png")}
}
game.image["maharajah"] = {}
game.image["maharajah"]["rest"] = {
  w = {love.graphics.newImage("img/maharajah/rest w.png")},
  a = {love.graphics.newImage("img/maharajah/rest a.png")},
  s = {love.graphics.newImage("img/maharajah/rest s.png")},
  d = {love.graphics.newImage("img/maharajah/rest d.png")},
}
game.image["maharajah"]["walk"] = {
  w = {
    love.graphics.newImage("img/maharajah/walk w 1.png"),
    love.graphics.newImage("img/maharajah/walk w 2.png")},
  a = {
    love.graphics.newImage("img/maharajah/walk a 1.png"),
    love.graphics.newImage("img/maharajah/walk a 2.png")},
  s = {
    love.graphics.newImage("img/maharajah/walk s 1.png"),
    love.graphics.newImage("img/maharajah/walk s 2.png")},
  d = {
    love.graphics.newImage("img/maharajah/walk d 1.png"),
    love.graphics.newImage("img/maharajah/walk d 2.png")}
}
game.image["guard"] = {}
game.image["guard"]["rest"] = {
  w = {love.graphics.newImage("img/guard/rest w.png")},
  a = {love.graphics.newImage("img/guard/rest a.png")},
  s = {love.graphics.newImage("img/guard/rest a.png")},
  d = {love.graphics.newImage("img/guard/rest d.png")},
}
game.image["guard"]["walk"] = {
  w = {
    love.graphics.newImage("img/guard/walk w 1.png"),
    love.graphics.newImage("img/guard/walk w 2.png")},
  a = {
    love.graphics.newImage("img/guard/walk a 1.png"),
    love.graphics.newImage("img/guard/walk a 2.png")},
  s = {
    love.graphics.newImage("img/guard/walk a 1.png"),
    love.graphics.newImage("img/guard/walk a 2.png")},
  d = {
    love.graphics.newImage("img/guard/walk d 1.png"),
    love.graphics.newImage("img/guard/walk d 2.png")}
}
game.image["janbon"] = {}
game.image["janbon"]["rest"] = {
  w = {love.graphics.newImage("img/janbon/rest w.png")},
  a = {love.graphics.newImage("img/janbon/rest a.png")},
  s = {love.graphics.newImage("img/janbon/rest a.png")},
  d = {love.graphics.newImage("img/janbon/rest d.png")},
}
game.image["janbon"]["walk"] = {
  w = {
    love.graphics.newImage("img/janbon/walk w 1.png"),
    love.graphics.newImage("img/janbon/walk w 2.png")},
  a = {
    love.graphics.newImage("img/janbon/walk a 1.png"),
    love.graphics.newImage("img/janbon/walk a 2.png")},
  s = {
    love.graphics.newImage("img/janbon/walk a 1.png"),
    love.graphics.newImage("img/janbon/walk a 2.png")},
  d = {
    love.graphics.newImage("img/janbon/walk d 1.png"),
    love.graphics.newImage("img/janbon/walk d 2.png")}
}
game.image["smith"] = {}
game.image["smith"]["rest"] = {
  w = {love.graphics.newImage("img/smith/rest w.png")},
  a = {love.graphics.newImage("img/smith/rest a.png")},
  s = {love.graphics.newImage("img/smith/rest a.png")},
  d = {love.graphics.newImage("img/smith/rest d.png")},
}
game.image["smith"]["walk"] = {
  w = {
    love.graphics.newImage("img/smith/walk w 1.png"),
    love.graphics.newImage("img/smith/walk w 2.png")},
  a = {
    love.graphics.newImage("img/smith/walk a 1.png"),
    love.graphics.newImage("img/smith/walk a 2.png")},
  s = {
    love.graphics.newImage("img/smith/walk a 1.png"),
    love.graphics.newImage("img/smith/walk a 2.png")},
  d = {
    love.graphics.newImage("img/smith/walk d 1.png"),
    love.graphics.newImage("img/smith/walk d 2.png")}
}
game.image.map = love.graphics.newImage("img/map/Map01.png")
game.image.roofNoble = love.graphics.newImage("img/map/Roof01.png")
game.image.roofBuro = love.graphics.newImage("img/map/Roof02.png")
game.image["sword"] = {}
game.image["sword"]["rest"] = {
  w = {
    love.graphics.newImage("img/map/Sword01.png"),
    love.graphics.newImage("img/map/Sword02.png"),
    love.graphics.newImage("img/map/Sword03.png"),
    love.graphics.newImage("img/map/Sword04.png")
  }
}
game.image["prize"] = {}
game.image["prize"]["rest"] = {
  w = {love.graphics.newImage("img/prize.png")}
}
game.image["gianni"] = {}
game.image["gianni"]["rest"] = {
  s = {love.graphics.newImage("img/gianni.png")}
}
game.image.sword2 = love.graphics.newImage("img/map/Sword02.png")
game.image.sword3 = love.graphics.newImage("img/map/Sword03.png")
game.image.wall = love.graphics.newImage("img/map/Walls.png")
game.image.wall2 = love.graphics.newImage("img/map/Walls2.png")
game.image.lightBeam = love.graphics.newImage("img/map/Light Beam.png")
game.image.stench = {}
game.image.stench[1] = love.graphics.newImage("img/stench1.png")
game.image.stench[2] = love.graphics.newImage("img/stench2.png")
game.image.stench[3] = love.graphics.newImage("img/stench3.png")
game.image.cone = {}
game.image.cone["w"] = love.graphics.newImage("img/guard/cone w.png")
game.image.cone["a"] = love.graphics.newImage("img/guard/cone a.png")
game.image.cone["s"] = love.graphics.newImage("img/guard/cone s.png")
game.image.cone["d"] = love.graphics.newImage("img/guard/cone d.png")
game.image.portrait = {}
game.image.portrait["smith"] = love.graphics.newImage("img/portrait/Blacksmith.png")
game.image.portrait["char"] = love.graphics.newImage("img/portrait/Everyman.png")
game.image.portrait["gianni"] = love.graphics.newImage("img/portrait/Gianni.png")
game.image.portrait["janbon"] = love.graphics.newImage("img/portrait/Lord Janbon Candant.png")
game.image.portrait["maharajah"] = love.graphics.newImage("img/portrait/Maharajah.png")
game.image.portrait["guard"] = love.graphics.newImage("img/portrait/empty.png")
game.image.portrait["people"] = love.graphics.newImage("img/portrait/empty.png")

game.portraitNames = {
  ["smith"]="Big Bertha", ["char"]="Billy", ["gianni"]="Senior Director Gianni",
  ["janbon"]="Lord Janbon Candant", ["maharajah"]="Maharajah Musklose Bishep",
  ["guard"]="Guard", ["people"]="Commoner"
}


game.entity = {}
function game.entity.setState(e, newState)
  if newState == e.state then
  else
    e.state = newState
    e.n = 1
    e.t = 0
  end
end
function game.entity.distance(e1, e2)
  return math.sqrt((e1.x - e2.x)^2 + (e1.y - e2.y)^2)
end

function game.getDir(dx, dy)
  if dx > dy then
    if dy > -dx then
      return "d"
    else
      return "w"
    end
  else
    if dy > -dx then
      return "s"
    else
      return "a"
    end
  end
end

function game.entity.newTarget(e, x, y, v, message)
  if not e.target then e.target = {} end
  e.target[#e.target+1] = {x=math.floor(x), y=math.floor(y), v=v, message=message}
end

local function getQuad(axis_x,axis_y,vert_x,vert_y)
	if vert_x < axis_x then
		if vert_y < axis_y then
			return 1
		else
			return 4
		end
	else
		if vert_y < axis_y then
			return 2
		else
			return 3
		end	
	end
end
function game.pointInPolygon(pgon, tx, ty)
	if (#pgon < 6) then
		return false
	end
 
	local x1 = pgon[#pgon - 1]
	local y1 = pgon[#pgon]
	local cur_quad = getQuad(tx,ty,x1,y1)
	local next_quad
	local total = 0
	local i
 
	for i = 1,#pgon,2 do
		local x2 = pgon[i]
		local y2 = pgon[i+1]
		next_quad = getQuad(tx,ty,x2,y2)
		local diff = next_quad - cur_quad
 
		if (diff == 2) or (diff == -2) then
			if (x2 - (((y2 - ty) * (x1 - x2)) / (y1 - y2))) < tx then
				diff = -diff
			end
		elseif diff == 3 then
			diff = -1
		elseif diff == -3 then
			diff = 1
		end
 
		total = total + diff
		cur_quad = next_quad
		x1 = x2
		y1 = y2
	end
 
	return (math.abs(total)==4)
end
game.inside = false
game.polygon = {}
game.polygon[1] = {
  1017.02714001201, 610.18967389781,
  1017.02714001201, 602.18967389781,
  1100.02714001201, 602.18967389781,
  1100.02714001201, 517.18967389781,
  900.02714001201, 517.18967389781,
  900.02714001201, 602.18967389781,
  978.02714001201, 602.18967389781,
  978.40623026900, 610.875910017640,
  956.04041200131, 610.75743800262,
  892.01038599946, 674.84169799834,
  555.53013600409, 674.84169799834,
  555.53013600409, 693.25480204169,
  520.90276587522, 693.25480204169,

  473.33248997107, 693.38346397970,
  481.36258997023, 742.03335999977,

  530.84326987620, 751.30373603897,
  554.93400186999, 751.30373603897,
  555.53013600409, 765.91729999520,
  888.69746397017, 765.91729999520,
  961.86433196068, 834.79007001268,

  961.86433196068, 1278.7081900309,
  849.74099996500, 1306.7028940306,
  792.07424800610, 1421.3613100047,
  842.11861000629, 1502.4004240078,
  887.13140199892, 1493.4116380080,

  923.10092200292, 1518.4271620028,
  924.17398000136, 1543.4086900041,
  944.07999400282, 1547.4034900032,
  964.06918600900, 1533.4322859999,
  984.12560801022, 1533.4322859999,

  996.12498400966, 1548.4276059922,
  1007.1711400151, 1548.4276059922,
  1021.3139080256, 1535.4846519884,
  1045.3890280263, 1535.4846519884,
  1063.3819240239, 1547.3977839947,

  1082.3982760264, 1543.3812339907,
  1085.4062260268, 1518.3790839929,
  1119.4560700189, 1492.3768959870,
  1119.2184160417, 1479.5324339787,
  1157.2130620433, 1479.5324339787,

  1157.2130620433, 1458.5290019750,
  1171.1747320439, 1458.5290019750,
  1171.1747320439, 1481.5681019798,
  1207.2990640462, 1419.5456699957,
  1148.4799540462, 1320.4517499846,

  1043.3825680520, 1285.5554799875,
  1043.9698799816, 829.92942596786,
  1113.1367939827, 764.05180195812,
  1600.1087520062, 762.04393195920,
  1600.1087520062, 715.00187995844,

  1566.0969419894, 715.00187995844,
  1566.0969419894, 683.99115595967,
  1528.0728599941, 683.99115595967,
  1528.0728599941, 714.97961997055,
  1476.0113760014, 714.97961997055,

  1476.0113760014, 682.98515996896,
  1108.6989659769, 682.98515996896,
  1040.6619759719, 610.75743800262}
game.polygon[2] = {
  930.00831999816, 1325.1539939945,
  972.52162800170, 1325.1539939945,
  972.52162800170, 1336.1490359949,
  935.55259201443, 1336.1490359949,
  935.55259201443, 1395.1213619928,
  972.59391001426, 1395.1213619928,
  972.59391001426, 1450.1324159885,
  931.56120002037, 1450.1324159885,
  931.56120002037, 1436.1118559865,
  956.52072602184, 1436.1118559865,
  956.52072602184, 1410.1479959860,
  919.48765202193, 1410.1479959860,
  919.48765202193, 1325.0963579817}
game.polygon[3] = {
  846.94501403254, 1396.7575560044,
  855.95574803185, 1396.7575560044,
  855.95574803185, 1433.7622800050,
  889.97385803377, 1433.7622800050,
  889.97385803377, 1448.7591360020,
  837.91897403542, 1448.7591360020,
  837.91897403542, 1399.7412780020}
game.polygon[4] = {
  1017.3216699949, 1321.7273499467,
  1055.4953199974, 1321.7273499467,
  1055.4953199974, 1434.7495959490,
  1091.4895899943, 1434.7495959490,
  1091.4895899943, 1449.7512279474,
  1038.4221819905, 1449.7512279474,
  1038.4221819905, 1411.6988919396,
  1014.4586619874, 1411.6988919396,
  1014.4586619874, 1395.6578619475,
  1040.4596859845, 1395.6578619475,
  1040.4596859845, 1335.4968879442,
  1016.4153399807, 1335.4968879442,
  1016.4153399807, 1323.5392119410}
game.polygon[5] = {
  1169.2467479804, 1364.2358280020,
  1169.2467479804, 1446.2930220040,
  1134.2154599819, 1446.2462880043,
  1134.2154599819, 1437.2364600049,
  1156.2837299844, 1437.2364600049,
  1156.2837299844, 1376.2163219973,
  1124.2516019754, 1376.2163219973,
  1124.2516019754, 1362.2545560030}
  
function game.randomDir()
  local r = love.math.random()
  if r < 0.25 then
    return "w"
  elseif r < 0.5 then
    return "a"
  elseif r < 0.75 then
    return "s"
  else
    return "d"
  end
end

game.cutscene = false

game.message = {}

function game.hasMessage(str)
  for im = #game.message, 1, -1 do
    if str == game.message[im] then
      table.remove(game.message, im)
      return true
    end
  end
  return false
end

game.camera = {}
game.dialogue = {}
game.people = {}
for i = 1, 100 do
  game.people[i] = {}
end
function game.people.reposition()
  for i = 1, 20 do
    local x = love.math.random(965, 1035)
    local y = love.math.random(850, 1250)
    game.people[i].x=x
    game.people[i].y=y
    game.people[i].type="people"
    game.people[i].state="rest"
    game.people[i].dir=game.randomDir()
    game.people[i].n=1
    game.people[i].group="south"
    game.people[i].t=0
  end
  for i = 21, 40 do
    local x = love.math.random(965, 1035)
    local y = love.math.random(1000, 1100)
    game.people[i].x=x
    game.people[i].y=y
    game.people[i].type="people"
    game.people[i].state="rest"
    game.people[i].dir=game.randomDir()
    game.people[i].n=1
    game.people[i].group="church"
    game.people[i].t=0
  end
  for i = 41, 45 do
    local x = love.math.random(560, 900)
    local y = love.math.random(680, 760)
    game.people[i].x=x
    game.people[i].y=y
    game.people[i].type="people"
    game.people[i].state="rest"
    game.people[i].dir=game.randomDir()
    game.people[i].n=1
    game.people[i].group="noble"
    game.people[i].t=0
  end
  for i = 46, 75 do
    local x = love.math.random(1100, 1460)
    local y = love.math.random(680, 760)
    game.people[i].x=x
    game.people[i].y=y
    game.people[i].type="people"
    game.people[i].state="rest"
    game.people[i].dir=game.randomDir()
    game.people[i].n=1
    game.people[i].group="eastern"
    game.people[i].t=0
  end
  for i = 76, 100 do
    local x, y
    repeat 
      x = 2*love.math.random() - 1
      y = 2*love.math.random() - 1
    until 0.2 <= x^2+y^2 and x^2+y^2 <= 1
    x = math.floor( x * 100 + 1000 )
    y = math.floor( y * 100 + 720 )
    game.people[i].x=x
    game.people[i].y=y
    game.people[i].type="people"
    game.people[i].state="rest"
    game.people[i].dir=game.randomDir()
    game.people[i].n=1
    game.people[i].group="center"
    game.people[i].t=0
  end
end

game.guard = {}
for i = 1, 9 do
  game.guard[i] = love.filesystem.load("guard.lua")()
end
game.guard.cone = false
game.guard[1].x=941.94868598366
game.guard[1].y=1305.1559579722
game.guard[1].x1=941.94868598366
game.guard[1].y1=1305.1559579722
game.guard[1].x2=1048.9243959822
game.guard[1].y2=1305.1559579722
game.guard[2].x=943.80982597591
game.guard[2].y=1357.1461679670
game.guard[2].x1=943.80982597591
game.guard[2].y1=1357.1461679670
game.guard[2].x2=1034.7339339857
game.guard[2].y2=1357.1461679670
game.guard[3].x=1004.7765099886
game.guard[3].y=1410.1507319673
game.guard[3].x1=1004.7765099886
game.guard[3].y1=1410.1507319673
game.guard[3].x2=1004.7765099886
game.guard[3].y2=1478.1752039655
game.guard[4].x=836.77571197972
game.guard[4].y=1465.1424539695
game.guard[4].x1=836.77571197972
game.guard[4].y1=1465.1424539695
game.guard[4].x2=967.75542997522
game.guard[4].y2=1465.1424539695
game.guard[5].x=863.75243197428
game.guard[5].y=1416.1047839723
game.guard[5].x1=863.75243197428
game.guard[5].y1=1416.1047839723
game.guard[5].x2=952.76069197338
game.guard[5].y2=1416.1047839723
game.guard[6].x=890.98712797044
game.guard[6].y=1305.0651419791
game.guard[6].x1=890.98712797044
game.guard[6].y1=1305.0651419791
game.guard[6].x2=910.00694797141
game.guard[6].y2=1488.1153799733
game.guard[7].x=1066.8876879755
game.guard[7].y=1335.1983319316
game.guard[7].x1=1066.8876879755
game.guard[7].y1=1335.1983319316
game.guard[7].x2=1153.9414119767
game.guard[7].y2=1335.1983319316
game.guard[8].x=1064.9187219725
game.guard[8].y=1401.0954559431
game.guard[8].x1=1064.9187219725
game.guard[8].y1=1401.0954559431
game.guard[8].x2=1149.9692259752
game.guard[8].y2=1401.0954559431
game.guard[9].x=1148.0021919729
game.guard[9].y=1461.1478599301
game.guard[9].x1=1148.0021919729
game.guard[9].y1=1461.1478599301
game.guard[9].x2=1054.9667019723
game.guard[9].y2=1461.1478599301

game.bure = {}
game.bure[1] = { x=923.81075999060, y=488.06447199371, type="people", state="rest", dir="s", n=1, t=0 }
game.bure[2] = { x=953.81301599031, y=488.06447199371, type="people", state="rest", dir="s", n=1, t=0 }
game.bure[3] = { x=984.82261799032, y=488.06447199371, type="people", state="rest", dir="s", n=1, t=0 }
game.bure[4] = { x=1049.8422059903, y=488.06447199371, type="people", state="rest", dir="s", n=1, t=0 }

game.blackbarT = 0

function game.load(game)
  game.char = require "char"
  game.entity[1] = game.char
  game.camera.fix = game.char
  
  game.maharajah = { x=1000, y=1500, type="maharajah", state="rest", dir="s", n=1, t=0 }
  game.entity[2] = game.maharajah
  
  game.janbon = { x=476, y=710, type="janbon", state="rest", dir="d", n=1, t=0 }
  game.entity[3] = game.janbon

  game.smith = { x=1540, y=689, type="smith", state="rest", dir="d", n=1, t=0 }
  game.entity[4] = game.smith

  game.sword = {x = 1000, y=724, type="sword", state="rest", dir="w", n=1, t=0}
  game.entity[5] = game.sword
  
  game.prize = {x = 1000, y=1548, type="prize", state="rest", dir="w", n=1, t=0}
  game.entity[6] = game.prize

  game.gianni = {x = 1016.3663999955, y = 544.46029799321, type="gianni", state="rest", dir="s", n=1, t=0}
  game.entity[7] = game.gianni

  game.people.reposition()
  for i = 1, #game.people do
    game.entity[#game.entity+1] = game.people[i]
  end

  for i = 1, #game.guard do
    game.entity[#game.entity+1] = game.guard[i]
  end

  for i = 1, #game.bure do
    game.entity[#game.entity+1] = game.bure[i]
  end

  game.dialogue[1] = {actor="char", text="I'm  telling  you  it's  time  to  act  now, \nscrew  bureaucracy!"}
  game.dialogue[2] = {actor="gianni", text="But  we  already  have  a  123-step  plan  that  will \nresolve  the  situation  within  a  100  years  from  now."}
  game.dialogue[3] = {actor="char", text="Excalibur  is  sinking  into  the  rock  right  now! \nAccording  to  my  calculations  we  barely  have  3  days!"}
  game.dialogue[4] = {actor="gianni", text="Listen  lad,  it's  a  long,  loong  process \nand  nobody  wants  to  go  through  it."}
  game.dialogue[5] = {actor="char", text="I'll  find  someone!  Maybe  the  Maharajah  who's \ncamping  in  the  southern  part  of  the  city...  \nScrew  everyone  in  here!"}
end
game.miao = 0
game.stench_strength = 1
function game.update(game, dt, main, input)
  --print(dt)
  --print(game.sword.n)

  if input.keyboard.z == 1 then
    print(game.char.x, game.char.y)
  end

  if game.state == "beginning" then
    if game.entity.distance(game.char, game.maharajah) < 20 then
      game.state = "movePeople"
      game.moved = 0

      game.dialogue[1] = {actor="char", text="Your  Highness!  Britain  needs  a  new  ruler!"}
      game.dialogue[2] = {actor="maharajah", text="Guards!  What's  this  fool's  talking  about?"}
      game.dialogue[3] = {actor="char", text="Listen,  Excalibur  is  sinking  into  its  rock.  \nOnly  the  strongest  person  will  be  able  to  extract  it \nand  proclaim..."}
      game.dialogue[4] = {actor="maharajah", text="I'M  THE  STRONGEST!!  I'll  do  it."}
      game.dialogue[5] = {actor="char", text="Oh  may  the  sky  bless  you,  your  mighty  Highness."}
      game.dialogue[6] = {actor="char", text="I  need  to  inform  you  that  there  might  be  \nSOME  paperwork  to  do  first..."}
      game.dialogue[7] = {actor="maharajah", text="GUARDS!!  40  OF  YOU,  PAPERWORK,  NOW!!"}
      game.dialogue[8] = {actor="maharajah", text="Of  course  there's  no  use  in  this  \nif  there's  no  one  watching."}
      game.dialogue[9] = {actor="maharajah", text="You,  boy!  GO  GATHER  EVERYONE!! \nAT  THIS  VERY  INSTANT!!"}
    end
  end

  if game.state == "movePeople" or game.state == "moveCenter" then
    for ie, e in ipairs(game.entity) do
      if e.type=="people" and not e.moving and
        game.entity.distance(e, game.char) < 20 then
        e.moving = true
        game.moved = game.moved + 1
        if e.group=="south" then
          game.entity.newTarget(e, e.x, love.math.random(770, 840), 40)
        elseif e.group=="church" then
          game.entity.newTarget(e, e.x, love.math.random(770, 840), 40)
        elseif e.group=="noble" then
          game.entity.newTarget(e, love.math.random(880, 960), e.y, 40)
        elseif e.group=="eastern" then
          game.entity.newTarget(e, love.math.random(1060, 1140), e.y, 40)
        elseif e.group=="center" then
          local dx = game.sword.x - e.x
          local dy = game.sword.y - e.y
          local dist = math.sqrt(dx^2 + dy^2)
          local r = dist - love.math.random(40, dist/2)
          if dist < 40 then r = 0 end
          local x = e.x + dx/dist*r
          local y = e.y + dy/dist*r
          game.entity.newTarget(e, x, y, 40)
        elseif e.group=="camp" then
        end
      end
    end
  end

  if game.state == "movePeople" then
    if game.moved > 70 then
      game.state = "moveCenter"
    end
  end

  if game.state == "moveCenter" then
    if game.entity.distance(game.char, game.sword) < 50 then
      game.cutscene = true
      game.camera.fix = game.sword
      game.maharajah.y = 900
      game.entity.newTarget(game.maharajah, 1000, 731, 40, "firstMoving")
      game.state = "firstCutsceneStart"
      game.entity.setState(game.char, "rest")
    end
  end

  if game.hasMessage("firstMoving") then
    game.dialogue[1] = {actor="maharajah", text="Watch,  Westerners!  Behold  my  strength!\n", message="firstTrying1"}
  end

  if game.hasMessage("firstTrying1") then
    game.mahaTimer = 0
    game.state = "firstCutscene1"
  end

  if game.state == "firstCutscene1" then
    game.mahaTimer = game.mahaTimer + dt
    if game.mahaTimer < 1 then
      game.entity.setState(game.maharajah, "walk")
    else
      game.entity.setState(game.maharajah, "rest")
      game.dialogue[1] = {actor="maharajah", text="Hhhmmmnieggh"}
      game.dialogue[2] = {actor="maharajah", text="Blalalalaaargh", message="firstTrying2"}
      game.state = "limbo1"
    end
  end

  if game.hasMessage("firstTrying2") then
    game.mahaTimer = 0
    game.state = "firstCutscene3"
  end

  if game.state == "firstCutscene3" then
    game.mahaTimer = game.mahaTimer + dt
    if game.mahaTimer < 1 then
      game.entity.setState(game.maharajah, "walk")
    else
      game.entity.setState(game.maharajah, "rest")
      game.dialogue[1] = {actor="maharajah", text="Cacacacacaca"}
      game.dialogue[2] = {actor="maharajah", text="TIAAAAAAAA", message="firstTrying3"}
      game.state = "limbo2"
    end
  end

  if game.hasMessage("firstTrying3") then
    game.mahaTimer = 0
    game.state = "firstCutscene4"
  end

  if game.state == "firstCutscene4" then
    game.mahaTimer = game.mahaTimer + dt
    if game.mahaTimer < 2 then
      game.entity.setState(game.maharajah, "walk")
    else
      game.dialogue[1] = {actor="maharajah", text="Hmmm...."}
      game.dialogue[2] = {actor="maharajah", text="Ahem...."}
      game.dialogue[3] = {actor="maharajah", text="People!  I  must  stop  at  once", message="endFirst"}
      game.dialogue[4] = {actor="maharajah", text="I'm  *ahem*  afraid  I  could  break  the  sword  \nif  I  apply  this  much  force."}
      game.dialogue[5] = {actor="maharajah", text="I  shall  return  to  my  camp.", message="firstTrying4"}
      game.state = "limbo2"
    end
  end

  if game.hasMessage("firstTrying4") then
    game.state = "firstCutscene5"
    game.entity.newTarget(game.maharajah, 1000, 1200, 40)
    game.mahaTimer = 0
  end

  if game.state == "firstCutscene5" then
    game.mahaTimer = game.mahaTimer + dt
    if game.mahaTimer < 3 then
    else
      game.dialogue[1] = {actor="char", text="*Sigh*"}
      game.dialogue[2] = {actor="char", text="I  guess  he  was  not  the  one.",  message="firstBlackout"}
      game.state = "limbo3"
    end
  end

  if game.hasMessage("firstBlackout") then
    game.state = "firstBlackout"
    game.blackout = {text="Second Day", t=0}
    game.mahaTimer = nil
  end

  if game.state == "firstBlackout" then
    if game.blackout.t < 3 then
    else
      game.blackout = nil
      game.people.reposition()
      game.state = "initSecond"
      game.cutscene = false
      game.camera.fix = game.char
      game.maharajah.x = -1000
      game.maharajah.target = nil
      game.char.x = 1000
      game.char.y = 700
      game.char.dir = "s"
      game.sword.n = 2
      game.dialogue[1] = {actor="char", text="Yesterday  was  a  failure."}
      game.dialogue[2] = {actor="char", text="And  the  sword  is  sinking  more  and  more."}
      game.dialogue[3] = {actor="char", text="But  I  think I  know  just  the  right  person"}
      game.dialogue[4] = {actor="char", text="Lord  Janbon  Candant  lives  in  the  palace  west  of  here\n"}
      game.dialogue[5] = {actor="char", text="Who  other  than  him  could  be  \nthe  rightful  ruler  of  Britain?\n"}
      game.dialogue[6] = {actor="char", text="Actually  that  sounds  horrible..."}
      game.dialogue[7] = {actor="char", text="But  I  must  try.", message="toJanbon"}
    end
  end

  if game.hasMessage("toJanbon") then
    game.state = "toJanbon"
  end

  if game.state == "toJanbon" then
    if game.entity.distance(game.char, game.janbon) < 30 then
      game.state = "steal"
      game.caught = false
      game.guard.cone = true

      game.dialogue[1] = {actor="char", text="My  Lord,  I'm  Billy,  your  faithful  servant."}
      game.dialogue[2] = {actor="janbon", text="Away  with  you,  beggar!"}
      game.dialogue[3] = {actor="char", text="But  Sir!  I'm  not  begging!  Britain  is  begging!"}
      game.dialogue[4] = {actor="janbon", text="And  why  should  I  care  about  this  shabby  country?"}
      game.dialogue[5] = {actor="janbon", text="But  anyways,  what  do  you  want?  Be  quick!"}
      game.dialogue[6] = {actor="char", text="Well...  \nYou  are  already  the  richest  person  of  this  country.\nSurely  you're  also  its  true  leader!"}
      game.dialogue[7] = {actor="char", text="All  you  need  to  do  is  to  go  and  extract  Excalibur."}
      game.dialogue[8] = {actor="janbon", text="Interesting...  \nFinally  I  could  exploit  more  people!\n*diabolical  laugh*"}
      game.dialogue[9] = {actor="janbon", text="Of  course  I'd  never  be  able  \nto  extract  it  with  my  strength.\nUnless..."}
      game.dialogue[10] = {actor="janbon", text="Unless  I  employ  my  superb  alchemical  abilities!"}
      game.dialogue[11] = {actor="janbon", text="But,  alas,  I  lack  an  ingredient."}
      game.dialogue[12] = {actor="janbon", text="Listen  you  stupid  brat!\nI  heard  the  marajah  might  have  \nwhat  I  really  need."}
      game.dialogue[13] = {actor="janbon", text="Collect  (and  of  course,  I  mean  steal)  \nthe  vial  from  his  tent!"}
      game.dialogue[14] = {actor="janbon", text="And  don't  get  caught  by  the  guards!\nThey'll  surely  kill  you  on  sight."}
    end
  end

  if game.state == "steal" then
    if game.caught == true then
      game.caught = nil
      game.dialogue[1] = {actor="guard", text="Hello  there!  Such  a  nice  weather  today."}
    end

    if game.entity.distance(game.char, game.prize) < 15 then
      game.prize.x = -1000
      game.state = "backtoJanbon"
    end
  end

  if game.state == "backtoJanbon" then
    if game.entity.distance(game.char, game.janbon) < 30 then
      game.state = "limbo"
      game.dialogue[1] = {actor="janbon", text="Why  did  it  take  you  so  long!\nIncompetent  brat."}
      game.dialogue[2] = {actor="janbon", text="Good.  \nNow  I  can  finally  complete  my  mixture."}
      game.dialogue[3] = {actor="janbon", text="The  world  shall  be  mine!\n*diabolical  laughter*", message="blackoutJanbon"}
    end
  end

  if game.hasMessage("blackoutJanbon") then
    game.state = "blackoutJanbon"
    game.blackout = {text="", t=0}
  end

  if game.state == "blackoutJanbon" then
    if game.blackout.t < 1 then
    else
      game.blackout = nil
      game.state = "limbo"
      game.cutscene = true
      game.camera.fix = game.sword
      game.char.x = 990
      game.char.y = 690
      game.char.dir = "s"
      game.entity.setState(game.char, "rest")
      game.janbon.x = 800
      game.janbon.y = 730
      game.entity.newTarget(game.janbon, 995, 730, 40, "secondMoving")
    end
  end

  if game.hasMessage("secondMoving") then
    game.dialogue[1] = {actor="janbon", text="Hihihihihi!", message="secondTrying1"}
    game.dialogue[1] = {actor="janbon", text="Behold  the  power  of  alchemy!", message="secondTrying1"}
  end

  if game.hasMessage("secondTrying1") then
    game.lordTimer = 0
    game.state = "secondCutscene4"
  end
  if game.state == "secondCutscene4" then
    game.lordTimer = game.lordTimer + dt
    if game.lordTimer < 3 then
      game.entity.setState(game.janbon, "walk")
    end
    if game.lordTimer < 1 then
      game.stench_n = 1
      if game.miao == 0 then
        game.miao = 1
        for ip, p in ipairs(game.people) do
          if p.group == "center" then
            local dx = game.sword.x - p.x
            local dy = game.sword.y - p.y
            p.dir = game.getDir(dx, dy)
          end
        end
      end
    elseif game.lordTimer < 2 then
      game.stench_n = 2
      if game.miao == 1 then
        game.miao = 2
        for ip, p in ipairs(game.people) do
          if p.group == "center" then
            local dx = game.sword.x - p.x
            local dy = game.sword.y - p.y
            local x = game.sword.x - dx*100
            local y = game.sword.y - dy*100
            game.entity.newTarget(p, x, y, 40)
          end
        end
      end
    elseif game.lordTimer < 3 then
      game.stench_n = 3
    else
      game.dialogue[1] = {actor="janbon", text="Fuck.", message="secondTrying4"}
      game.state = "limbo2"
    end
  end

  if game.hasMessage("secondTrying4") then
    game.state = "secondCutscene5"
    game.entity.newTarget(game.janbon, 800, 730, 40)
    game.lordTimer = 0
  end

  if game.state == "secondCutscene5" then
    game.lordTimer = game.lordTimer + dt
    if game.lordTimer < 3 then
    else
      game.dialogue[1] = {actor="char", text="*Bleargh*"}
      game.dialogue[2] = {actor="char", text="Maybe  it's  better  this  way.",  message="secondBlackout"}
      game.state = "limbo3"
    end
  end

  if game.hasMessage("secondBlackout") then
    game.state = "secondBlackout"
    game.blackout = {text="Third Day", t=0}
    game.lordTimer = nil
  end

  if game.state == "secondBlackout" then
    if game.blackout.t < 3 then
    else
      game.blackout = nil
      game.people.reposition()
      if game.miao == 2 then
        game.miao = 3
        for ip, p in ipairs(game.people) do
          if p.group == "center" then
            p.x = -1000
            p.target = nil
          end
        end
      end
      game.janbon.x = -1000
      game.janbon.target = nil
      game.state = "initThird"
      game.cutscene = false
      game.camera.fix = game.char
      game.char.x = 1000
      game.char.y = 700
      game.char.dir = "s"
      game.sword.n = 3
      game.stench_strength = 0.3
      game.dialogue[1] = {actor="char", text="Yesterday  was  the  worst."}
      game.dialogue[2] = {actor="char", text="The  sword  is  basically  disappearing."}
      game.dialogue[3] = {actor="char", text="Maybe  there's  still  a  chance.\nA  pure  person  with  an  uncorrupted  heart:\nBertha  the  Blacksmith."}
      game.dialogue[4] = {actor="char", text="She's  our  only  hope.\nHer  workshop  lies  in  the  eastern  road.", message="toBertha"}
    end
  end

  if game.hasMessage("toBertha") then
    game.state = "toBertha"
  end

  if game.state == "toBertha" then
    if game.entity.distance(game.char, game.smith) < 30 then
      game.state = "toBure"

      game.dialogue[1] = {actor="char", text="Bertha.  Strength  and  money  couldn't  rule  our  country."}
      game.dialogue[2] = {actor="char", text="But  maybe  your  pure  heart  will."}
      game.dialogue[3] = {actor="smith", text="What  are  you  trying  to  say?"}
      game.dialogue[4] = {actor="char", text="Bertha,  the  situation  is  desperate."}
      game.dialogue[5] = {actor="smith", text="As  always."}
      game.dialogue[6] = {actor="char", text="I'm  serious.\nThe  sword  is  sinking  deeper  and  deeper\nand  it's  gonna  be  impossible  to  pull  it  out."}
      game.dialogue[7] = {actor="smith", text="What  difference  does  that  make?\nOur  society  is  rotten  to  the  core."}
      game.dialogue[8] = {actor="char", text="But  Bertha...  You  could  be  the  difference!"}
      game.dialogue[8] = {actor="char", text="You  have  to  try  to  pull  it."}
      game.dialogue[9] = {actor="smith", text="Ours  is  a  nation  which  runs  on  mediocrity."}
      game.dialogue[10] = {actor="smith", text="I  mean,  look  at  the  \nRoyal  Bureau  For  Excalibur  Extraction  Protocol.\nThat's  completely  ridiculous."}
      game.dialogue[11] = {actor="smith", text="This  overwhelming  bureaucracy.\nTake the  people  working  under  there\n"}
      game.dialogue[12] = {actor="smith", text="Don't  tell  me  that  they  have  not  dreamed  the  dream\nand  attempted  to  pull  out  the  sword"}
      game.dialogue[13] = {actor="smith", text="for  they  have,  and  they  have  failed."}
      game.dialogue[14] = {actor="smith", text="And  yet,  they're  the  very  ones\nwho  check  who  is  fit  and  unfit"}
      game.dialogue[15] = {actor="smith", text="to  try  and  become  the  wielder\nof  Excalibur,  which  should  be  a  right  of  everyone."}
      game.dialogue[16] = {actor="smith", text="Do  you  think  they'd  let  a  woman?\nI  have  no  chance."}
      game.dialogue[17] = {actor="char", text="...I  work  at  RBEEP.  I  can  help  you  go\nthrough  the  process."}
      game.dialogue[18] = {actor="smith", text="...I  see;  sorry  for  what  i've  just  said.\nOk,  we'll  try."}
      game.dialogue[19] = {actor="smith", text="I  mean,  I  don't  think  I'm\n truly  our  ruler.  But  I  can  try"}
      game.dialogue[20] = {actor="char", text="I'm  immensely  grateful.\nI'll  go  to  the  RBEEP  center\nand  I'll  get  the  paperwork  done,  somehow."}
    end
  end
  
  if game.state == "toBure" then
    if game.char.y < 540 then
      game.dialogue[1] = {actor="char", text="Ok.  I  can  do  this.", message="hours"}
      game.state = "limbo"
    end
  end

  if game.hasMessage("hours") then
    game.state = "hourBlackout"
    game.blackout = {text="5  hours  later  (DLC  content)", t=0}
  end

  if game.state == "hourBlackout" then
    if game.blackout.t < 3 then
    else
      game.blackout = nil
      game.state = "limbo"
      game.cutscene = true
      game.camera.fix = game.sword
      game.char.x = 990
      game.char.y = 690
      game.char.dir = "s"
      game.entity.setState(game.char, "rest")
      game.smith.x = 1200
      game.smith.y = 730
      game.entity.newTarget(game.smith, 1005, 730, 40, "thirdMoving")
    end
  end

  if game.hasMessage("thirdMoving") then
    game.dialogue[1] = {actor="smith", text="I  hope  this  was  not  time  wasted.", message="thirdTrying1"}
  end

  if game.hasMessage("thirdTrying1") then
    game.lordTimer = 0
    game.state = "thirdCutscene4"
  end
  if game.state == "thirdCutscene4" then
    game.lordTimer = game.lordTimer + dt
    if game.lordTimer < 4 then
      game.entity.setState(game.smith, "walk")
    else
      game.entity.setState(game.smith, "rest")
      game.dialogue[1] = {actor="smith", text="I'm  truly  sorry."}
      game.dialogue[2] = {actor="smith", text="I  guess  I'm  not  better\n  than  the  others.", message="thirdTrying4"}
      game.state = "limbo2"
    end
  end

  if game.hasMessage("thirdTrying4") then
    game.state = "thirdCutscene5"
    game.lordTimer = 0
  end

  if game.state == "thirdCutscene5" then
    game.lordTimer = game.lordTimer + dt
    if game.lordTimer < 1 then
    else
      game.dialogue[1] = {actor="char", text="I'm  sorry  too.", message="thirdBlackout"}
      game.state = "limbo3"
    end
  end

  if game.hasMessage("thirdBlackout") then
    game.state = "thirdBlackout"
    game.blackout = {text="Fourth Day", t=0}
    game.lordTimer = nil
  end

  if game.state == "thirdBlackout" then
    if game.blackout.t < 3 then
    else
      game.blackout = nil
      
      game.smith.x = -1000
      game.smith.target = nil
      game.state = "initThird"
      game.cutscene = true
      game.camera.fix = game.sword
      game.char.x = 1000
      game.char.y = 700
      game.char.dir = "s"
      game.sword.n = 4
      game.stench_strength = 0
      game.dialogue[1] = {actor="char", text="This  is  hopeless.  I'm  hopeless."}
      game.dialogue[2] = {actor="char", text="I  guess  this  sword  will  just  fall\nDEEPER  AND  DEEPER."}
      game.dialogue[3] = {actor="char", text="Deeper  and  deeper...\nAnd  I've  never  tried  to  pull  it  myself...", message="pointer"}
    end
  end

  if game.hasMessage("pointer") then
    game.people[1].x = 1200
    game.people[1].y = 700
    game.entity.newTarget(game.people[1], 1050, 700, 40, "aagh")
    game.state = "limbo"
  end

  if game.hasMessage("aagh") then
    game.dialogue[1] = {actor="people", text="No  sword!?  And  look,\nhe's  got  a  sword!"}
    game.dialogue[2] = {actor="people", text="People,  come!!  Our  true  leader!!"}
    game.dialogue[3] = {actor="char", text="So  I  was  to  become  the  ruler\nall  along!?"}
    game.dialogue[4] = {actor="char", text="What  an  unexpected  and  non-rushed  ending!"}
    game.dialogue[5] = {actor="char", text="Gather  round  people!\nI'm  your  rightful  king!", message="finalfinal"}
    game.state = "limbo"
  end

  if game.hasMessage("finalfinal") then
    main.state = "ending"
  end


  game.inside = game.char.x < 550 or game.char.y < 610

  for ie, e in ipairs(game.entity) do
    if e.update then e:update(dt, game, input) end
    if e.t then e.t = e.t + dt end
    if e.target then
      local t = e.target[1]
      local dx = t.x - e.x
      local dy = t.y - e.y
      local dist = math.sqrt(dx^2 + dy^2)
      if dist >= t.v * dt then
        game.entity.setState(e, "walk")
        e.dir = game.getDir(dx, dy)
        e.x = e.x + dx/dist*t.v*dt
        e.y = e.y + dy/dist*t.v*dt
        if e.t < 0.2 then e.n = 1
        elseif e.t < 0.4 then e.n = 2
        else e.t = e.t - 0.4 end
      else
        e.x = t.x
        e.y = t.y
        if t.message then game.message[#game.message+1] = t.message end
        table.remove(e.target, 1)
        if #e.target == 0 then
          game.entity.setState(e, "rest")
          e.target = nil
        end
      end
    end
    if not e.offset then
      e.offset = love.math.random()/10
    end
  end
  --print(game.char.x, game.char.y)
  if game.cutscene then
    game.blackbarT = game.blackbarT + dt
  end

  if game.blackout then
    game.blackout.t = game.blackout.t + dt
  end

  if #game.dialogue>0 then
    if not game.dialogueT then game.dialogueT = 0
    else game.dialogueT = game.dialogueT + dt end
    if game.dialogueT > 0.1 then
      if input.keyboard.z == 1 then
        if game.dialogue[1].message then
          game.message[#game.message+1]= game.dialogue[1].message
        end
        table.remove(game.dialogue, 1)
        if #game.dialogue==0 then game.dialogueT = nil end
      end
    end
  end
end

function game.coordToPixel(cx, cy)
  local px = cx - game.camera.fix.x + pw/2
  local py = cy - game.camera.fix.y + ph/2
  if game.camera.fix.x > 1500 then px = cx - 1500 + pw/2 end
  return px, py
end

game.pixelCanvas = love.graphics.newCanvas(pw, ph)

function game.draw(game)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas(game.pixelCanvas)
  love.graphics.clear()

  local zerox, zeroy = game.coordToPixel(0, 0)
  love.graphics.draw(game.image.map, zerox, zeroy)

  --print(game.inside)
  love.graphics.draw(game.image.wall, zerox, zeroy)
  if not game.inside then love.graphics.draw(game.image.wall2, zerox, zeroy) end

  local sortTable = {}
  for ie, e in ipairs(game.entity) do
    sortTable[#sortTable+1] = {i=ie, y=e.y+e.offset}
  end
  table.sort(sortTable, function(a, b) return a.y < b.y end)
  for i = 1, #sortTable do
    local ie = sortTable[i].i
    local e = game.entity[ie]
    local px, py = game.coordToPixel(e.x, e.y)
    --print(e.type, e.state, e.dir, e.n)
    local img = game.image[e.type][e.state][e.dir][e.n]
    love.graphics.draw(img, px, py, 0, 1, 1, img:getWidth()/2, img:getHeight()/2)
  end


  if game.inside then love.graphics.draw(game.image.wall2, zerox, zeroy) end

  if game.guard.cone then
    for i = 1, 9 do
      local sx, sy = game.coordToPixel(game.guard[i].x, game.guard[i].y)
      local dir = game.guard[i].dir
      local img = game.image.cone[dir]
      local size = 0.1
      --local angle = direction_table[game.guard[i].dir]
      if dir=="w" then love.graphics.draw(img, sx, sy, 0, size, size, img:getWidth()/2, img:getHeight()) end
      if dir=="a" then love.graphics.draw(img, sx, sy, 0, size, size, img:getWidth(), img:getHeight()/2) end
      if dir=="s" then love.graphics.draw(img, sx, sy, 0, size, size, img:getWidth()/2, 0) end
      if dir=="d" then love.graphics.draw(img, sx, sy, 0, size, size, 0, img:getHeight()/2) end
    end
  end

  if game.char.x > 550 then
    love.graphics.draw(game.image.roofNoble, zerox, zeroy)
  end
  if game.char.y > 610 then
    love.graphics.draw(game.image.roofBuro, zerox, zeroy)
  end

  --do
  --  love.graphics.setColor(1, 1, 1)
  --  local x100 = math.floor( game.char.x/100 ) * 100
  --  local y100 = math.floor( game.char.y/100 ) * 100
  --  local sx100, sy100 = game.coordToPixel(x100, y100)
  --  love.graphics.line(0, sy100, pw, sy100)
  --  love.graphics.line(sx100, 0, sx100, ph)
  --end

  --for j = 1, #game.polygon do
  --  local vertices = {}
  --  for i = 1, #game.polygon[j], 2 do
  --    vertices[i], vertices[i+1] = game.coordToPixel(game.polygon[j][i], game.polygon[j][i+1])
  --    love.graphics.print(i, vertices[i], vertices[i+1])
  --  end
  --  love.graphics.polygon("line", vertices)
  --  love.graphics.print(j, vertices[1], vertices[2])
  --end

  love.graphics.setColor(1, 1, 1, 0.8)
  love.graphics.draw(game.image.lightBeam, zerox, zeroy)
  love.graphics.setColor(1, 1, 1, 1)

  if game.stench_n then
    love.graphics.setColor(1, 1, 1, game.stench_strength)
    local sx, sy = game.coordToPixel(game.sword.x, game.sword.y)
    local img = game.image.stench[game.stench_n]
    love.graphics.draw(img, sx, sy, 0, 1, 1, img:getWidth()/2, img:getHeight()/2)
  end

  love.graphics.setCanvas()
  love.graphics.setColor(1, 1, 1, 1)
  love.graphics.draw(game.pixelCanvas, 0, 0, 0, 4, 4)

  if game.cutscene then
    if game.blackbarT and game.blackbarT < 2 then
      love.graphics.setColor(0, 0, 0, game.blackbarT/2)
    else
      love.graphics.setColor(0, 0, 0, 1)
    end
    love.graphics.rectangle("fill", 0, 0, sw, sh/8)
    love.graphics.rectangle("fill", 0, sh*7/8, sw, sh/8)
  end

  if #game.dialogue>0 then
    love.graphics.setColor(1, 1, 1, 1)
    local img = game.image.portrait[game.dialogue[1].actor]
    love.graphics.draw(img, 30, 210, 0, 1, 1)

    love.graphics.setColor(1, 1, 1, 1)
    love.graphics.rectangle("fill", 20, 420, 760, 160)
    love.graphics.setColor(0, 0, 0)

    love.graphics.setFont(bigFont)
    love.graphics.print(game.portraitNames[game.dialogue[1].actor]..":", 40, 420)


    love.graphics.setFont(mediumFont)
    love.graphics.print(game.dialogue[1].text, 60, 460)

  end

  if game.blackout then
    love.graphics.clear(0, 0, 0)
    love.graphics.setColor(1, 1, 1)
    love.graphics.setFont(bigFont)
    love.graphics.printf(game.blackout.text, 0, sh/2, sw, "center")
  end
end

return game