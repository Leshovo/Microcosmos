local Hero = require('modules.hero')
local graphics = require('modules.gra')

local Enemies = {}

function createEnemies(tableAxisesIdtableColorstable, tableDestinytableObject)
	Hero:createBidimensionalObjects(tableAxisesIdtableColorstable, tableDestinytableObject)
end

createEnemies({3, 8, {1, 2, 3}, {255, 200, 0, 255, primaryColor = 1, secondaryColor = 2}}, {Enemies, Hero})

return Enemies