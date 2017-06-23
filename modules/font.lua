require('modules.revised')
local graphics = require('modules.gra')

local Font = class()


function Font.newf(size)

	graphics.newFont(size)
	
end

function Font.setf(font)
	
	graphics.setFont(font)
	
end

function Font.setnf(size)

	graphics.setNewFont(size)
	
end

return Font