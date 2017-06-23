require('modules.revised')
local graphics = require('modules.gra')
local Bidimensional = require('modules.bidimensional')

local Ball = class()

Ball:addparent(Bidimensional)


isBallPickable = false
isBallOutOfView = false
isBallInAreaPoint = false
isBallFirstCheck = false
timeOneCounter = 0
timeTwoCounter = 0

function Ball:isPickable(Character)
  local indexBoardPositionAxisx = self.indexBoardPositionAxisx - Character.indexBoardPositionAxisx
  local indexBoardPositionAxisy = self.indexBoardPositionAxisy - Character.indexBoardPositionAxisy

  if indexBoardPositionAxisx == 0 and indexBoardPositionAxisy == 0 then
    isBallPickable = true
  else
    isBallPickable = false
  end
end

function Ball:pickBall(Character)
  if isBallPickable then
    Character.isInBallPosesion = true
    isBallOutOfView = true
  end
end

function Ball:updBall()
  if isBallInAreaPoint then

    if isBallFirstCheck then

      if not isEnemyTurn then

        timeOneCounter = timeOneCounter + 1

      elseif isEnemyTurn then

        timeTwoCounter = timeTwoCounter + 1

      end -- end thirty if

    end -- end second if
		isBallFirstCheck = false
		isBallOutOfView = false
		isBallPickable = false
		self.indexBoardPositionAxisx = 4
		self.indexBoardPositionAxisy = 5

  end -- end first if

end -- end function

return Ball
