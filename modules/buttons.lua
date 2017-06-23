require('modules.revised')

local suit = require('modules.suit')


local Buttons = {}

function Buttons:createLayout(tableAxistablePaddingtableSuitinstance)
	local axisx = tableAxistablePaddingtableSuitinstance[1].axisx
	local axisy = tableAxistablePaddingtableSuitinstance[1].axisy
	local axisxPadding = tableAxistablePaddingtableSuitinstance[2].axisxPadding
	local axisyPadding = tableAxistablePaddingtableSuitinstance[2].axisyPadding
	local suitInstance = tableAxistablePaddingtableSuitinstance[3]
	
	suitInstance.layout:reset(axisx, axisy)
	suitInstance.layout:padding(axisxPadding , axisyPadding)
end

return Buttons
