require 'system'
require 'player' 
require 'map' 
function love.load()
  player=Player:init()
	dline=DEBUGLINE:init()
	generateMap()
	game.setState(1)
	game.setScene(1) 
	dline:send('Welcome to RogueProtoype')
	saveGame() 
end

function love.keypressed(k)
	player:move(game.getState(),k)
	readinput(k)
	if k == ' ' then dline:send('Hello World') end 
end

function love.update(dt)
	dline:update(game.getState(),dt)
end

function love.draw()
	local state = game.getState() 
	dline:draw(state)
	player:draw(state)
	GUIDRAWING(state)
	mapdraw(state) 
end
