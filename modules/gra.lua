require('modules.revised') 
-- Its a module for simplifying a bite writing of graphics in love 

local graphics = 
{
	setColor = love.graphics.setColor,
	setBackgroundColor = love.graphics.setBackgroundColor,
	line = love.graphics.line ,
	print = love.graphics.print,
	rectangle  = love.graphics.rectangle,
	setFont = love.graphics.setFont,
	setNewFont = love.graphics.setNewFont,
	newFont = love.graphics.newFont,
	newImageFont = love.graphics.newImageFont,
	clear = love.graphics.clear,
	circle = love.graphics.circle,
}

return graphics