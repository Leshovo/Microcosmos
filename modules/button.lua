require('modules.revised')

local suit = require('modules.suit')

local Button = class()

function Button:createButton(tableTitleAxistableSizetable)
	local title = tableTitleAxistableSizetable[1]
	local axisx = tableTitleAxistableSizetable[2].axisx
	local axisy = tableTitleAxistableSizetable[2].axisy
	local width = tableTitleAxistableSizetable[3].width
	local height = tableTitleAxistableSizetable[3].height

	local button = suit.Button(title, axisx, axisy, width, height)
	return button
end

function Button:createButtonInLayoutRow(tableTitleSuitinstanceSizetable)
	local title = tableTitleSuitinstanceSizetable[1]
	local suitInstance = tableTitleSuitinstanceSizetable[2] or suit
	local width = tableTitleSuitinstanceSizetable[3].width
	local height = tableTitleSuitinstanceSizetable[3].height

	return suitInstance.Button(title, suitInstance.layout:row(width, height))
end

function Button:createButtonInLayoutCol(tableTitleSuitinstanceSizetable)
	local title = tableTitleSuitinstanceSizetable[1]
	local suitInstance = tableTitleSuitinstanceSizetable[2] or suit
	local width = tableTitleSuitinstanceSizetable[3].width
	local height = tableTitleSuitinstanceSizetable[3].height

	return suitInstance.Button(title, suitInstance.layout:col(width, height))
end

function Button:createButtonInLayoutUp(tableTitleSuitinstanceSizetable)
	local title = tableTitleSuitinstanceSizetable[1]
	local suitInstance = tableTitleSuitinstanceSizetable[2] or suit
	local width = tableTitleSuitinstanceSizetable[3].width
	local height = tableTitleSuitinstanceSizetable[3].height

	return suitInstance.Button(title, suitInstance.layout:up(width, height))
end


function Button:createButtonInLayoutDown(tableTitleSuitinstanceSizetable)
	local title = tableTitleSuitinstanceSizetable[1]
	local suitInstance = tableTitleSuitinstanceSizetable[2] or suit
	local width = tableTitleSuitinstanceSizetable[3].width
	local height = tableTitleSuitinstanceSizetable[3].height

	return suitInstance.Button(title, suitInstance.layout:down(width, height))
end

function Button:createButtonInLayoutLeft(tableTitleSuitinstanceSizetable)
	local title = tableTitleSuitinstanceSizetable[1]
	local suitInstance = tableTitleSuitinstanceSizetable[2] or suit
	local width = tableTitleSuitinstanceSizetable[3].width
	local height = tableTitleSuitinstanceSizetable[3].height

	return suitInstance.Button(title, suitInstance.layout:left(width, height))
end

return Button
