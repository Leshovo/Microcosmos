local Hero = require('modules.hero')
local graphics = require('modules.gra')


local Heroes = {}

function Heroes:createHeroes(tableAxisesIdtableColorstable)
	Hero:createBidimensionalObjects(tableAxisesIdtableColorstable, {Heroes, Hero})
end

Heroes:createHeroes{3, 1, {"Iustitia", "Lehoia", "Vorona"}, {0, 150, 255, 255, primaryColor = 3, secondaryColor = 2}}

return Heroes
