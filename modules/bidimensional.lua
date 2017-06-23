require('modules.revised')
local graphics = require('modules.gra')

local Bidimensional = class()
Bidimensional.boardPositionAxisx = {}
Bidimensional.boardPositionAxisy = {}

Bidimensional:creatingBoardPositionPixelsAxisx()
Bidimensional:creatingBoardPositionPixelsAxisy()

function Bidimensional:creatingBoardPositionPixelsAxisx()
	local augment = 8
	for i = 1, 8, 1 do
		self.boardPositionAxisx[i] = augment
		augment = augment + 31
	end
	
end

function Bidimensional:creatingBoardPositionPixelsAxisy()
  local augment = 8
  for i = 1, 8, 1 do
    self.boardPositionAxisy[i] = augment
		augment = augment + 31
  end
	
end


function Bidimensional:modifyAxisPosition(indexBoardPositionAxisx, indexBoardPositionAxisy)
  self.indexBoardPositionAxisx = indexBoardPositionAxisx
  self.indexBoardPositionAxisy = indexBoardPositionAxisy
  self.pixelPositionAxisx = self.boardPositionAxisx[self.indexBoardPositionAxisx]
  self.pixelPositionAxisy = self.boardPositionAxisy[self.indexBoardPositionAxisy]
end

function Bidimensional:modifyBallAxisPosition(indexBoardPositionAxisx, indexBoardPositionAxisy)
  self.indexBoardPositionAxisx = indexBoardPositionAxisx
  self.indexBoardPositionAxisy = indexBoardPositionAxisy
  self.pixelPositionAxisx = self.boardPositionAxisx[self.indexBoardPositionAxisx] + 10
  self.pixelPositionAxisy = self.boardPositionAxisy[self.indexBoardPositionAxisy] + 10
end

function Bidimensional:drawRectangle()
	self:modifyAxisPosition(self.indexBoardPositionAxisx, self.indexBoardPositionAxisy)
	graphics.setColor(self.color[1], self.color[2], self.color[3], self.color[4])
	graphics.rectangle("fill", self.pixelPositionAxisx,self.pixelPositionAxisy, 16, 16)
	graphics.setColor(255,255,255,255)
end

function Bidimensional:drawBall(colorTable)
 
 if not isBallOutOfView then
		graphics.setColor(colorTable[1], colorTable[2], colorTable[3], colorTable[4])
  elseif isBallOutOfView then
    graphics.setColor(colorTable[1],colorTable[2],colorTable[3], 0)
  end
	
	graphics.circle("fill", self.pixelPositionAxisx + 5, self.pixelPositionAxisy + 5, 8)
	graphics.setColor(255, 255, 255, 255)
end

function Bidimensional:createBidimensionalObjects(tableAxisesIdtableColorstable, tableDestinytableObject)
	local indexBoardPositionAxisx = tableAxisesIdtableColorstable[1]
	local indexBoardPositionAxisy = tableAxisesIdtableColorstable[2]
	local ids = tableAxisesIdtableColorstable[3]
	local colors = tableAxisesIdtableColorstable[4]
	
	for index, value in  ipairs(ids) do
		self:createBidimensionalObject({indexBoardPositionAxisx, indexBoardPositionAxisy, value, colors}, tableDestinytableObject)
		indexBoardPositionAxisx = indexBoardPositionAxisx + 1
		multiplicanteum = 3
		multiplicantedois = 2
		colors[colors.primaryColor] = (colors[colors.primaryColor]/4) * multiplicanteum
		colors[colors.secondaryColor] = (colors[colors.primaryColor]/4) * multiplicantedois
		multiplicanteum = multiplicanteum - 1
		multiplicantedois = multiplicantedois - 1
	end
	
end

function Bidimensional:createBidimensionalObject(tableAxisesIdColorstable, tableDestinytableObject)
	local indexBoardPositionAxisx = tableAxisesIdColorstable[1]
	local indexBoardPositionAxisy = tableAxisesIdColorstable[2]
	local id = tableAxisesIdColorstable[3]
	local colors = tableAxisesIdColorstable[4]
	local destinyTable = tableDestinytableObject[1]
	local object = tableDestinytableObject[2]
	
	destinyTable[id] = object:new()
	destinyTable[id]:constructor{indexBoardPositionAxisx, indexBoardPositionAxisy, destinyTable[id].boardPositionAxisx[destinyTable[id].indexBoardPositionAxisx], destinyTable[id].boardPositionAxisy[destinyTable[id].indexBoardPositionAxisy]; {colors[1], colors[2], colors[3], colors[4]}}
end


function Bidimensional:constructor(tableConstructor)
	self.indexBoardPositionAxisx = tableConstructor[1]
	self.indexBoardPositionAxisy = tableConstructor[2]
	self.pixelPositionAxisx = tableConstructor[3]
	self.pixelPositionAxisy = tableConstructor[4]
	self.color = tableConstructor[5]
end

return Bidimensional
